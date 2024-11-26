import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/pages/cart/cart_tab.dart';
import 'package:green_io/src/pages/home/home_tab.dart';
import 'package:green_io/src/pages/orders/orders_tab.dart';
import 'package:green_io/src/pages/profile/profile_tab.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _pageController.jumpToPage(_currentIndex);
          });
        },
        unselectedItemColor: AppColors.grey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        fixedColor: AppColors.appSwatchColor,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Orders',
            icon: Icon(Icons.shopping_bag_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person_rounded),
          ),
        ],
      ),
    );
  }
}
