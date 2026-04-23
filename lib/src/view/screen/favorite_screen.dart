import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final ProductController controller;

  @override
  void initState() {
    super.initState();

    // Initialize controller once
    controller = Get.put(ProductController());

    // ✅ Call outside build
    controller.getFavoriteItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: GetBuilder<ProductController>(
          builder: (controller) {
            if (controller.filteredProducts.isEmpty) {
              return _emptyState();
            }

            return ProductGridView(
              items: controller.filteredProducts,

              likeButtonPressed: (index) {
                controller.toggleFavorite(index); // assuming this exists
              },

              isPriceOff: (product) =>
                  controller.isPriceOff(product),
            );
          },
        ),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          Text(
            "No Favorites Yet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Tap heart icon to add products",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}