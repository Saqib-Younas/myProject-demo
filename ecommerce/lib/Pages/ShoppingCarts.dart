import 'package:flutter/material.dart';

class ShoppingCarts extends StatelessWidget {
  const ShoppingCarts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: const Center(
        child: Text('Shopping Cart Page'),
      ),
    );
  }
}