import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find<ProductController>();
    
    // Sirf favorites dikhane ke liye fetch karein
    controller.getFavoriteItems();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("My Wishlist", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          if (controller.filteredProducts.isEmpty) {
            return _emptyState();
          }

          return Padding(
            padding: const EdgeInsets.all(12),
            child: ProductGridView(
              items: controller.filteredProducts,
              likeButtonPressed: (index) {
                // FIXED: Get the product first
                final product = controller.filteredProducts[index];
                
                // FIXED: Pass the product object to controller
                controller.toggleFavorite(product);
              },
              isPriceOff: (product) => controller.isPriceOff(product),
            ),
          );
        },
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.favorite_border_rounded, size: 80, color: Colors.grey),
          SizedBox(height: 15),
          Text("No Favorites Yet", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Items you heart will appear here.", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}