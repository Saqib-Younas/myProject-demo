import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
enum AppbarActionType { leading, trailing }

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final ProductController productController = Get.put(ProductController());

  /// 🔹 APP BAR BUTTON
  Widget appBarActionButton(AppbarActionType type) {
    IconData icon =
        type == AppbarActionType.trailing ? Icons.search : Icons.menu;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.lightGrey,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget get _appBar {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appBarActionButton(AppbarActionType.leading),
              appBarActionButton(AppbarActionType.trailing),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 PROMO CARDS - Using Active Mobile Products from Database
  Widget _promoCards() {
    return GetBuilder<ProductController>(
      builder: (controller) {
        // Get active mobile products
        final List<Product> mobileProducts = controller.allProducts
            .where((p) => 
              p.category == "Apple" || 
              p.category == "Samsung" || 
              p.category == "Oppo" ||
              p.category == "Infinix"
            )
            .take(4)
            .toList();

        if (mobileProducts.isEmpty) {
          return const SizedBox(
            height: 180,
            child: Center(
              child: Text("No sale products available"),
            ),
          );
        }

        return SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mobileProducts.length,
            itemBuilder: (_, index) {
              final product = mobileProducts[index];

              return Container(
                width: 280,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "🔥 Summer Sale",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              product.category ?? "Mobile Deal",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              child: const Text(
                                "Shop Now",
                                style: TextStyle(color: Colors.orange),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        product.imageUrl ?? 'https://via.placeholder.com/120',
                        width: 120,
                        height: 180,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 120,
                            height: 180,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported,
                                color: Colors.grey),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  /// 🔹 STATIC HEADER
  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome 👋",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          "Find your best deals 🔥",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

  /// 🔹 CATEGORY HEADER
  Widget _topCategoriesHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Top categories",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextButton(
          onPressed: () {},
          child: const Text("SEE ALL"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),

              const SizedBox(height: 15),

              /// 🔥 PROMO CARDS
              _promoCards(),

              const SizedBox(height: 20),

              _topCategoriesHeader(context),

              const SizedBox(height: 10),

              /// 🛍 PRODUCTS GRID
              GetBuilder<ProductController>(
                builder: (controller) {
                  return ProductGridView(
                    items: controller.filteredProducts,
                    likeButtonPressed: (index) =>
                        controller.toggleFavorite(index),
                    isPriceOff: (product) =>
                        controller.isPriceOff(product),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}