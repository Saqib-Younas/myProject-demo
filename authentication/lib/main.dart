import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/auth_screen.dart';
import 'screens/payment_screen.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: AppTheme.lightTheme,
      
      // Agar aap testing ke liye direct Payment page dekhna chahte hain,
      // to niche '/' ki jagah '/payment' likh dein.
      initialRoute: '/', 

      routes: {
        '/': (context) => const AuthScreen(),
        '/payment': (context) => const PaymentScreen(),
      },

      // Safety check: Agar koi ghalat route enter kare to Login par bhej de
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const AuthScreen());
      },
    );
  }
}