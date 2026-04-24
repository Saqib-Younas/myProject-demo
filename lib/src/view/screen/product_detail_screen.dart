import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/core/app_color.dart';
import 'package:e_commerce_flutter/src/core/services/session_service.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final ProductController controller = Get.put(ProductController());

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.textDark),
    );
  }

  Widget productPageView(double width, double height) {
    return Container(
      height: height * 0.42,
      width: width,
      decoration: const BoxDecoration(
        color: AppColor.grey100,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(120),
          bottomLeft: Radius.circular(120),
        ),
      ),
      child: Image.network(
        product.imageUrl ?? 'https://via.placeholder.com/300',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: AppColor.grey100,
          child: const Icon(Icons.image_not_supported,
              size: 100, color: AppColor.textGrey),
        ),
      ),
    );
  }

  Widget _ratingBar(BuildContext context) {
    return Wrap(
      spacing: 20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: product.rating,
          itemSize: 18,
          itemBuilder: (_, __) => const FaIcon(
            FontAwesomeIcons.solidStar,
            color: AppColor.warning,
          ),
          onRatingUpdate: (_) {},
        ),
        Text(
          "(4.5K Reviews)",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.textGrey,
                fontWeight: FontWeight.w400,
              ),
        )
      ],
    );
  }

  Widget productSizesListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.sizeType(product).length,
      itemBuilder: (_, index) {
        final item = controller.sizeType(product)[index];

        return InkWell(
          onTap: () =>
              controller.switchBetweenProductSizes(product, index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            alignment: Alignment.center,
            width: item.isSelected ? 75 : 60,
            decoration: BoxDecoration(
              color: item.isSelected
                  ? AppColor.primary
                  : AppColor.card,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: item.isSelected
                    ? AppColor.primary
                    : AppColor.grey300,
              ),
              boxShadow: item.isSelected
                  ? [
                      BoxShadow(
                        color: AppColor.primary.withOpacity(0.25),
                        blurRadius: 10,
                      )
                    ]
                  : [],
            ),
            child: Text(
              item.numerical,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: item.isSelected
                    ? Colors.white
                    : AppColor.textDark,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),

        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  productPageView(width, height),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// NAME
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textDark,
                          ),
                        ),

                        const SizedBox(height: 10),

                        _ratingBar(context),

                        const SizedBox(height: 12),

                        /// PRICE SECTION
                        Row(
                          children: [
                            Text(
                              product.discountPrice != null
                                  ? "Rs.${product.discountPrice}"
                                  : "Rs.${product.price}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                              ),
                            ),
                            const SizedBox(width: 6),

                            if (product.discountPrice != null)
                              Text(
                                "Rs.${product.price}",
                                style: const TextStyle(
                                  decoration:
                                      TextDecoration.lineThrough,
                                  color: AppColor.textGrey,
                                ),
                              ),

                            const Spacer(),

                            Text(
                              product.isAvailable
                                  ? "In Stock"
                                  : "Out of Stock",
                              style: TextStyle(
                                color: product.isAvailable
                                    ? AppColor.success
                                    : AppColor.error,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          "About",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textDark,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          product.about,
                          style: const TextStyle(
                            color: AppColor.textGrey,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Select Size",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textDark,
                          ),
                        ),

                        const SizedBox(height: 10),

                        SizedBox(
                          height: 45,
                          child: GetBuilder<ProductController>(
                            builder: (_) => productSizesListView(),
                          ),
                        ),

                        const SizedBox(height: 25),

                        /// BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: product.isAvailable
                                ? () {
                                    if (!SessionService.isLoggedIn) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Login required'),
                                          backgroundColor:
                                              AppColor.error,
                                        ),
                                      );
                                      Navigator.pushNamed(
                                          context, '/auth');
                                      return;
                                    }

                                    controller.addToCart(product);

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text('Added to cart'),
                                        backgroundColor:
                                            AppColor.success,
                                      ),
                                    );
                                  }
                                : null,
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}