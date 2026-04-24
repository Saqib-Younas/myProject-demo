import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_commerce_flutter/src/core/app_theme.dart';
import 'package:e_commerce_flutter/src/core/services/session_service.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/auth_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/payment_screen.dart';
import 'package:e_commerce_flutter/src/view/admin/admin_dashboard_screen.dart'; // ✅ Admin Screen Import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 SUPABASE INIT
  await Supabase.initialize(
    url: 'https://szfepoggnmgnydvpiunm.supabase.co',
    anonKey: 'sb_publishable_yh20i_HzG0EWXRNU8XY1TA_yEPnyBCV', 
  );

  // 🔥 SESSION INIT
  await SessionService.init();

  final currentUser = Supabase.instance.client.auth.currentUser;
  final bool isLoggedIn = currentUser != null;

  // Role Check Logic (Admin Check)
  String initialRoute = '/auth';
  if (isLoggedIn) {
    // Agar user logged in hai, check role in metadata
    final role = currentUser.userMetadata?['role'];
    initialRoute = (role == 'admin') ? '/admin' : '/home';
  }

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

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

      // ✅ Dynamic Initial Route based on Role
      initialRoute: initialRoute,

      routes: {
        '/home': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/admin': (context) => const AdminManageScreen(), // ✅ Admin Route Added
      },

      theme: AppTheme.lightAppTheme,
    );
  }
}