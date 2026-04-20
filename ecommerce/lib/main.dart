import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Pages/SpashScreen.dart';
import 'Pages/AuthPortal.dart';
import 'Pages/HomeMarketPlace.dart';
import 'Pages/ProductDetails.dart';
import 'Pages/ShoppingCarts.dart';
import 'Pages/CheckoutFlow.dart';
import 'Pages/OrderSuccess.dart';
import 'Pages/UserProfile.dart';
import 'Pages/AdminDashboard.dart';
import 'Pages/InventoryManagement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreenWidget(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthPortalWidget(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeMarketplaceWidget(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => const ProductDetailsWidget(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const ShoppingCarts(), // but it's empty
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutFlowWidget(),
    ),
    GoRoute(
      path: '/order-success',
      builder: (context, state) => const OrderSuccessWidget(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const UserProfileWidget(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminDashboardWidget(),
    ),
    GoRoute(
      path: '/inventory',
      builder: (context, state) => const InventoryManagementWidget(),
    ),
  ],
);