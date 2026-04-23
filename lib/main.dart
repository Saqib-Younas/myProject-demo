import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:e_commerce_flutter/src/core/app_theme.dart';
import 'package:e_commerce_flutter/src/core/services/session_service.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/auth_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/payment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://szfepoggnmgnydvpiunm.supabase.co',
    anonKey: 'sb_publishable_yh20i_HzG0EWXRNU8XY1TA_yEPnyBCV',
  );

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
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
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
