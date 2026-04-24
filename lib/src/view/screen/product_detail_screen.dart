import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/core/services/session_service.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find<ProductController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.9),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.9),
              child: GetBuilder<ProductController>(
                builder: (_) => IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite ? Colors.red : Colors.black,
                  ),
                  onPressed: () => controller.toggleFavorite(product),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- PRODUCT IMAGE SECTION ---
                Hero(
                  tag: product.id ?? '',
                  child: Container(
                    height: size.height * 0.50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey.shade200, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Image.network(
                          product.imageUrl ?? '',
                          fit: BoxFit.contain, // Mobile images look better in contain
                          errorBuilder: (_, __, ___) => const Icon(Icons.tablet_android, size: 100, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- CATEGORY TAG ---
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6366F1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          product.category?.toUpperCase() ?? "MOBILE",
                          style: const TextStyle(
                            color: Color(0xFF6366F1),
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- TITLE & AVAILABILITY ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 28, 
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // --- RATING SECTION ---
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: product.rating,
                            itemBuilder: (context, index) => const Icon(Icons.star_rounded, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 22.0,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${product.rating} / 5.0",
                            style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "|  In Stock",
                            style: TextStyle(
                              color: product.isAvailable ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      
                      const SizedBox(height: 30),

                      // --- DESCRIPTION ---
                      const Text(
                        "Specifications",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        product.about,
                        style: TextStyle(
                          color: Colors.grey.shade600, 
                          height: 1.6, 
                          fontSize: 15,
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Feature list (Visual elements)
                      _buildFeatureTile(Icons.battery_charging_full, "Long Battery Life"),
                      _buildFeatureTile(Icons.camera_alt_outlined, "Pro Camera System"),
                      _buildFeatureTile(Icons.speed, "Fastest Processor"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- FIXED BOTTOM BUY BAR ---
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35), 
                  topLeft: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08), 
                    blurRadius: 30, 
                    offset: const Offset(0, -10),
                  )
                ],
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Best Price", style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500)),
                      Text(
                        "Rs.${product.discountPrice ?? product.price}",
                        style: const TextStyle(
                          fontSize: 24, 
                          fontWeight: FontWeight.w900, 
                          color: Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: product.isAvailable ? () => _handleAddToCart(context, controller) : null,
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF6366F1)),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF4B5563)),
          ),
        ],
      ),
    );
  }

  void _handleAddToCart(BuildContext context, ProductController controller) {
    if (!SessionService.isLoggedIn) {
      Get.snackbar("Login Required", "Please login to purchase items",
          backgroundColor: Colors.redAccent, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
      Navigator.pushNamed(context, '/auth');
      return;
    }
    controller.addToCart(product);
    Get.snackbar("Added to Cart", "${product.name} is waiting for you!",
        backgroundColor: const Color(0xFF6366F1), 
        colorText: Colors.white, 
        snackPosition: SnackPosition.TOP, // Top looks more premium
        margin: const EdgeInsets.all(15),
        borderRadius: 15,
        icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white));
  }
}