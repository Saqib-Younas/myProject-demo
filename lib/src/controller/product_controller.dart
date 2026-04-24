import 'package:get/get.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/model/numerical.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductController extends GetxController {
  List<Product> allProducts = [];
  RxList<Product> filteredProducts = <Product>[].obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<dynamic> categories = <dynamic>[].obs; // Use your CategoryModel

  RxInt totalPrice = 0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    loadCategories();
  }
void filterProductsByName(String query) {
  if (query.isEmpty) {
    filteredProducts.assignAll(allProducts);
  } else {
    filteredProducts.assignAll(
      allProducts.where((p) => p.name.toLowerCase().contains(query.toLowerCase())).toList()
    );
  }
  update(); // UI ko refresh karne ke liye
}
  // --- FETCH DATA ---
  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final supabase = Supabase.instance.client;
      final response = await supabase
          .from('products')
          .select()
          .eq('is_active', true)
          .order('created_at', ascending: false);

      allProducts = (response as List).map((e) => Product.fromJson(e)).toList();
      filteredProducts.assignAll(allProducts);
    } catch (e) {
      print('Fetch Error: $e');
    } finally {
      isLoading.value = false;
      update();
    }
  }

  // --- FAVORITE LOGIC (FIXED) ---
  void toggleFavorite(Product product) {
    // 1. Direct object property update
    product.isFavorite = !product.isFavorite;

    // 2. Agar hum Favorites screen par hain, toh list refresh karein
    // Isse wo item screen se foran hat jayega
    getFavoriteItems(); 
    
    update();
  }

  void getFavoriteItems() {
    filteredProducts.assignAll(
      allProducts.where((e) => e.isFavorite).toList(),
    );
    update();
  }

  void getAllItems() {
    filteredProducts.assignAll(allProducts);
    update();
  }

  // --- CART LOGIC ---
  void addToCart(Product product) {
    if (product.cartQuantity <= 0) product.cartQuantity = 1;

    if (!cartProducts.any((item) => item.id == product.id)) {
      cartProducts.add(product);
    }
    calculateTotalPrice();
    update();
  }

  void increaseItemQuantity(Product product) {
    product.cartQuantity++;
    calculateTotalPrice();
    update();
  }

  void decreaseItemQuantity(Product product) {
    if (product.cartQuantity > 0) {
      product.cartQuantity--;
      if (product.cartQuantity == 0) {
        cartProducts.removeWhere((item) => item.id == product.id);
      }
    }
    calculateTotalPrice();
    update();
  }

  void calculateTotalPrice() {
    int total = 0;
    for (var item in cartProducts) {
      double price = isPriceOff(item) ? item.discountPrice! : item.price;
      total += (item.cartQuantity * price).toInt();
    }
    totalPrice.value = total;
  }

  bool get isEmptyCart => cartProducts.isEmpty;

  void getCartItems() {
    cartProducts.assignAll(allProducts.where((e) => e.cartQuantity > 0).toList());
    update();
  }

  bool isPriceOff(Product product) => product.discountPrice != null && product.discountPrice! < product.price;

  // --- CATEGORY & SIZES (PREVIOUS LOGIC) ---
  void loadCategories() { /* ... same as your code ... */ }

  String getCurrentSize(Product product) {
    // Optimized version
    final catSize = product.sizes?.categorical?.firstWhereOrNull((e) => e.isSelected);
    if (catSize != null) return "Size: ${catSize.categorical.name}";

    final numSize = product.sizes?.numerical?.firstWhereOrNull((e) => e.isSelected);
    if (numSize != null) return "Size: ${numSize.numerical}";

    return "";
  }
}