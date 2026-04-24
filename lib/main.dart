import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter_stripe/flutter_stripe.dart'; // ✅ correct package
import 'package:e_commerce_flutter/src/core/app_theme.dart';
import 'package:e_commerce_flutter/src/core/services/session_service.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/auth_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/payment_screen.dart';
import 'package:e_commerce_flutter/src/constants/api_constants.dart';
// import 'package:flutter/foundation.dart';  // kIsWeb import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // 🔥 STRIPE INIT (IMPORTANT)
  // if (kIsWeb) {
  //   // Web-specific Stripe publishable key
  //   Stripe.publishableKey = 'pk_test_51SZxFD5oMHTpDHuWBvKgJKBjBEdyKAVooVxPHfwAc9oxRUUFH8QqVQysGutbXb0G8dTCaK5QeFC5rxpiz3AvyA2d00exaHP0Rk';  // Replace with your actual web publishable key
  // } else {
  //   // Mobile/Desktop-specific Stripe publishable key
  //   Stripe.publishableKey = 'pk_test_51SZxFD5oMHTpDHuWBvKgJKBjBEdyKAVooVxPHfwAc9oxRUUFH8QqVQysGutbXb0G8dTCaK5QeFC5rxpiz3AvyA2d00exaHP0Rk';  // Replace with your actual mobile key
  // }
  
  // await Stripe.instance.applySettings();

  // // 🔥 SUPABASE INIT
  await Supabase.initialize(
    url: 'https://szfepoggnmgnydvpiunm.supabase.co',
    anonKey: 'sb_publishable_yh20i_HzG0EWXRNU8XY1TA_yEPnyBCV', // Replace with your Supabase anon key
  );

  // 🔥 SESSION INIT
  await SessionService.init();

  final bool isLoggedIn =
      Supabase.instance.client.auth.currentSession != null ||
          SessionService.userId != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),

      initialRoute: isLoggedIn ? '/home' : '/auth',

      routes: {
        '/home': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/payment': (context) => const PaymentScreen(),
      },

      theme: AppTheme.lightAppTheme,
    );
  }
}