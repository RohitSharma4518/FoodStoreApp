import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Cart/cart_view.dart';
import 'package:foodstore/Modules/Cart/emptycart_view.dart';
import 'package:foodstore/Modules/Dashboard/dashboard_view.dart';
import 'package:foodstore/Modules/ForgotPassword/forgotpswd_view.dart';
import 'package:foodstore/Modules/MenuDetail/menu_detail_view.dart';
import 'package:foodstore/Modules/Profile/profile.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? const DashboardView()
          : _selectedIndex == 1
              ? const CartView()
              : _selectedIndex == 2
                  ? const ForgotpswdView()
                  : const ProfileView(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: ColorConstants.navBarUnselectedColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
