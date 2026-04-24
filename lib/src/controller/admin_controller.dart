import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/product.dart';

class AdminController extends GetxController {
  final supabase = Supabase.instance.client;
  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchAdminProducts();
    super.onInit();
  }

  // --- READ ---
  Future<void> fetchAdminProducts() async {
    try {
      isLoading.value = true;
      final res = await supabase.from('products').select().order('created_at');
      products.assignAll((res as List).map((e) => Product.fromJson(e)).toList());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  // --- CREATE / UPDATE ---
  Future<void> saveProduct({
    String? id,
    required String name,
    required double price,
    required String about,
    required String imageUrl,
    required String category,
  }) async {
    try {
      isLoading.value = true;
      final data = {
        'name': name,
        'price': price,
        'about': about,
        'image_url': imageUrl,
        'category': category,
        'is_available': true,
      };

      if (id == null) {
        await supabase.from('products').insert(data);
        Get.snackbar("Success", "Product Added Successfully", snackPosition: SnackPosition.BOTTOM);
      } else {
        await supabase.from('products').update(data).eq('id', id);
        Get.snackbar("Success", "Product Updated Successfully", snackPosition: SnackPosition.BOTTOM);
      }
      fetchAdminProducts();
      Get.back(); // Close Form
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // --- DELETE ---
  Future<void> deleteProduct(String id) async {
    try {
      await supabase.from('products').delete().eq('id', id);
      products.removeWhere((p) => p.id == id);
      Get.snackbar("Deleted", "Product removed from database");
    } catch (e) {
      Get.snackbar("Error", "Could not delete product");
    }
  }
}