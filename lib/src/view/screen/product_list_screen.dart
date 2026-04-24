import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';
import 'package:e_commerce_flutter/src/model/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController controller = Get.put(ProductController());
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: _buildAppBar(),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFF6366F1)));
          }
          return RefreshIndicator(
            onRefresh: () => controller.fetchProducts(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isSearching) ...[
                    _buildHeader(context),
                    const SizedBox(height: 20),
                    _buildPromoCards(),
                    const SizedBox(height: 25),
                  ],
                  
                  _buildSectionHeader(context, isSearching ? "Search Results" : "New Arrivals"),
                  const SizedBox(height: 10),
                  
                  // Product Grid
                  controller.filteredProducts.isEmpty 
                    ? const Center(child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text("No products found", style: TextStyle(color: Colors.grey)),
                      ))
                    : ProductGridView(
                        items: controller.filteredProducts,
                        likeButtonPressed: (index) {
                          final product = controller.filteredProducts[index];
                          controller.toggleFavorite(product);
                        },
                        isPriceOff: (product) => controller.isPriceOff(product),
                      ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF8F9FD),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: TextField(
          controller: searchController,
          onChanged: (value) {
            // Controller mein search logic trigger karein
            controller.filterProductsByName(value); 
            setState(() {
              isSearching = value.isNotEmpty;
            });
          },
          decoration: InputDecoration(
            hintText: "Search luxury mobiles...",
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF6366F1)),
            suffixIcon: isSearching 
              ? IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.grey),
                  onPressed: () {
                    searchController.clear();
                    controller.filterProductsByName("");
                    setState(() => isSearching = false);
                  },
                )
              : null,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoCards() {
    return GetBuilder<ProductController>(
      builder: (controller) {
        final List<Product> promoProducts = controller.allProducts.take(3).toList();
        if (promoProducts.isEmpty) return const SizedBox();

        return SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: promoProducts.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (_, index) {
              final product = promoProducts[index];
              return Container(
                width: 320,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFFA855F7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("FLASH SALE", style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
                            Text(product.name, maxLines: 2, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text("Rs.${product.price}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                          ],
                        ),
                      ),
                      Image.network(product.imageUrl ?? '', width: 100, fit: BoxFit.contain),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text("Hello, Shopper! 👋", style: TextStyle(fontSize: 16, color: Colors.grey)),
        Text("Find Luxury Deals", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1A1A1A))),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        if (!isSearching) TextButton(onPressed: () {}, child: const Text("View All", style: TextStyle(color: Color(0xFF6366F1)))),
      ],
    );
  }
}