import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/empty_cart.dart';

final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCartItems();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => controller.isEmptyCart
                  ? const EmptyCart()
                  : const CartGrid(),
            ),
          ),
          const CartBottomSection(),
        ],
      ),
    );
  }
}

class CartGrid extends StatelessWidget {
  const CartGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth < 600 ? 2 : 3;

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.cartProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.70,
          ),
          itemBuilder: (context, index) {
            return CartItemCard(
              product: controller.cartProducts[index],
              index: index,
            );
          },
        );
      },
    );
  }
}

class CartItemCard extends StatefulWidget {
  final Product product;
  final int index;

  const CartItemCard({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final hasDiscount = controller.isPriceOff(product);

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(isHover ? 1.03 : 1),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHover
                ? const Color(0xFFEC6813)
                : Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: isHover
                  ? const Color(0xFFEC6813).withOpacity(0.15)
                  : Colors.black.withOpacity(0.05),
              blurRadius: isHover ? 18 : 8,
              offset: const Offset(0, 6),
            )
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// IMAGE
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.imageUrl ??
                          'https://via.placeholder.com/150',
                      height: 80,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 80,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                  ),

                  if (hasDiscount)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "-${_discountPercent(product)}%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 8),

              /// NAME
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 4),

              /// SIZE
              Text(
                controller.getCurrentSize(product),
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 6),

              /// PRICE
              Row(
                children: [
                  Text(
                    "Rs.${hasDiscount ? product.discountPrice : product.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEC6813),
                    ),
                  ),
                  const SizedBox(width: 6),
                  if (hasDiscount)
                    Text(
                      "Rs.${product.price}",
                      style: const TextStyle(
                        fontSize: 11,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),

              const Spacer(),

              /// QUANTITY
              Container(
                height: 34,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    _qtyButton(
                      icon: Icons.remove,
                      onTap: () =>
                          controller.decreaseItemQuantity(product),
                    ),

                    Expanded(
                      child: GetBuilder<ProductController>(
                        builder: (_) => Text(
                          '${controller.cartProducts[widget.index].quantity}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    _qtyButton(
                      icon: Icons.add,
                      onTap: () =>
                          controller.increaseItemQuantity(product),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      hoverColor: const Color(0xFFEC6813).withOpacity(0.1),
      child: SizedBox(
        width: 34,
        child: Icon(
          icon,
          size: 16,
          color: const Color(0xFFEC6813),
        ),
      ),
    );
  }

  int _discountPercent(Product p) {
    if (p.discountPrice == null) return 0;
    return (((p.price - p.discountPrice!) / p.price) * 100).round();
  }
}

class CartBottomSection extends StatelessWidget {
  const CartBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
          )
        ],
      ),

      child: Column(
        children: [

          /// TOTAL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 18),
              ),
              Obx(
                () => Text(
                  "Rs.${controller.totalPrice.value}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEC6813),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// CHECKOUT BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.isEmptyCart
                  ? null
                  : () => Navigator.pushNamed(context, '/payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEC6813),
                padding: const EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}