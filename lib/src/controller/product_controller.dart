import 'package:get/get.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/model/numerical.dart';
import 'package:e_commerce_flutter/src/model/product_size_type.dart';
import 'package:e_commerce_flutter/src/model/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductController extends GetxController {
  List<Product> allProducts = [];

  RxList<Product> filteredProducts = <Product>[].obs;
  RxList<Product> cartProducts = <Product>[].obs;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  RxInt totalPrice = 0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    loadCategories();
  }

  void loadCategories() {
    categories.assignAll([
      CategoryModel(
        name: "All",
        image: "https://cdn-icons-png.flaticon.com/512/1170/1170678.png",
        isSelected: true,
      ),
      CategoryModel(
        name: "Apple",
        image:
            "https://1000logos.net/wp-content/uploads/2017/02/Apple-Logosu.png",
      ),
      CategoryModel(
        name: "Samsung",
        image:
            "https://1000logos.net/wp-content/uploads/2017/06/Samsung-Logo.png",
      ),
      CategoryModel(
        name: "Infinix",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/7/7b/Infinix_logo.png",
      ),
      CategoryModel(
        name: "Oppo",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/0/04/OPPO_LOGO_2019.png",
      ),
    ]);
  }

  /// PRICE CHECK
  bool isPriceOff(Product product) {
    return product.discountPrice != null &&
        product.discountPrice! < product.price;
  }

  /// FETCH PRODUCTS
  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final supabase = Supabase.instance.client;

      final response = await supabase
          .from('products')
          .select()
          .eq('is_active', true)
          .order('created_at', ascending: false);

      allProducts =
          (response as List).map((e) => Product.fromJson(e)).toList();

      filteredProducts.assignAll(allProducts);
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
      update();
    }
  }

  /// FILTER
  void filterItemsByCategory(int index) {
    for (var e in categories) {
      e.isSelected = false;
    }

    categories[index].isSelected = true;

    if (categories[index].name == "All") {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        allProducts
            .where((e) => e.category == categories[index].name)
            .toList(),
      );
    }

    update();
  }

  /// ⭐ FIXED FAVORITE (OLD UI SUPPORT)
  void isFavorite(int index) {
    filteredProducts[index].isFavorite =
        !filteredProducts[index].isFavorite;
    update();
  }

  /// ⭐ ALIAS (NEW NAME SAFE)
  void toggleFavorite(int index) {
    isFavorite(index);
  }

  /// 🛒 CART
  void addToCart(Product product) {
    product.cartQuantity++;

    if (!cartProducts.contains(product)) {
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
    product.cartQuantity--;

    if (product.cartQuantity <= 0) {
      cartProducts.remove(product);
    }

    calculateTotalPrice();
    update();
  }

  bool get isEmptyCart => cartProducts.isEmpty;

  void calculateTotalPrice() {
    int total = 0;

    for (var item in cartProducts) {
      total += item.cartQuantity *
          (isPriceOff(item) ? item.discountPrice! : item.price).toInt();
    }

    totalPrice.value = total;
  }

  /// ⭐ FIXED: CART METHOD (NOW EXISTS)
  void getCartItems() {
    cartProducts.assignAll(
      allProducts.where((e) => e.cartQuantity > 0).toList(),
    );
    update();
  }

  /// ⭐ FIXED: FAVORITE METHOD (NOW EXISTS)
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

  /// SIZE HELPERS (UNCHANGED)
  List<Numerical> sizeType(Product product) {
    List<Numerical> list = [];

    final size = product.sizes;

    if (size?.numerical != null) {
      for (var e in size!.numerical!) {
        list.add(Numerical(e.numerical, e.isSelected));
      }
    }

    if (size?.categorical != null) {
      for (var e in size!.categorical!) {
        list.add(Numerical(e.categorical.name, e.isSelected));
      }
    }

    return list;
  }

  void switchBetweenProductSizes(Product product, int index) {
    if (product.sizes?.categorical != null) {
      for (var e in product.sizes!.categorical!) {
        e.isSelected = false;
      }
      product.sizes!.categorical![index].isSelected = true;
    }

    if (product.sizes?.numerical != null) {
      for (var e in product.sizes!.numerical!) {
        e.isSelected = false;
      }
      product.sizes!.numerical![index].isSelected = true;
    }

    update();
  }

  String getCurrentSize(Product product) {
    if (product.sizes?.categorical != null) {
      for (var e in product.sizes!.categorical!) {
        if (e.isSelected) return "Size: ${e.categorical.name}";
      }
    }

    if (product.sizes?.numerical != null) {
      for (var e in product.sizes!.numerical!) {
        if (e.isSelected) return "Size: ${e.numerical}";
      }
    }

    return "";
  }
}