import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';

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

  /// 🔥 PROMO CARDS
  Widget _promoCards() {
    final List<Map<String, String>> cards = [
      {
        "title": "Oppo Deals",
        "image":
            "https://fdn2.gsmarena.com/vv/bigpic/oppo-reno10.jpg",
      },
      {
        "title": "iPhone Sale",
        "image":
            "https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15-pro-max.jpg",
      },
      {
        "title": "Samsung Offer",
        "image":
            "https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s23.jpg",
      },
      {
        "title": "Xiaomi Discount",
        "image":
            "https://fdn2.gsmarena.com/vv/bigpic/xiaomi-13.jpg",
      },
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (_, index) {
          final item = cards[index];

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
                          item["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
                    item["image"]!,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          );
        },
      ),
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