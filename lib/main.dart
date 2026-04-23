import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:e_commerce_flutter/core/app_theme.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';

import 'screens/auth_screen.dart';
import 'screens/payment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://szfepoggnmgnydvpiunm.supabase.co',
    anonKey: 'sb_publishable_yh20i_HzG0EWXRNU8XY1TA_yEPnyBCV',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

      initialRoute: '/auth',

      routes: {
        '/home': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/payment': (context) => const PaymentScreen(),
      },

      theme: AppTheme.lightAppTheme,
    );
  }
}