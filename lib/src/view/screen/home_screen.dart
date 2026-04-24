import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/core/app_data.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/favorite_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/product_list_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/profile_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/orders_screen.dart';
import 'package:e_commerce_flutter/src/view/animation/page_transition_switcher_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newIndex = 0;

  // Screens list
  static final List<Widget> screens = [
    ProductListScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background me halka sa gradient touch dene ke liye stack use kiya hai
      extendBody: true, // Bottom bar ko transparent/floating look dene ke liye
      body: Stack(
        children: [
          // Subtle background color
          Container(color: const Color(0xFFF8F9FD)),
          
          // Page Content
          PageTransitionSwitcherWrapper(
            child: screens[newIndex],
          ),
        ],
      ),

      // --- Optimized Stylish Bottom Bar ---
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 20), // Floating effect
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: StylishBottomBar(
            currentIndex: newIndex,
            onTap: (index) {
              setState(() {
                newIndex = index;
              });
            },
            // Items optimized with premium gradients and active colors
            items: AppData.bottomNavBarItems.map((item) {
              return BottomBarItem(
                icon: Icon(
                  item.icon.icon, // Pehle wala icon
                  size: 26,
                ),
                selectedIcon: Icon(
                  item.icon.icon,
                  size: 28,
                  color: const Color(0xFF6366F1), // Modern Indigo
                ),
                backgroundColor: item.activeColor.withOpacity(0.1),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),

            // Bubble options for a premium animated feel
            option: BubbleBarOptions(
              barStyle: BubbleBarStyle.horizontal, // Beautiful active state
              bubbleFillStyle: BubbleFillStyle.fill,
              opacity: 0.15,
              unselectedIconColor: Colors.grey.shade400,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}