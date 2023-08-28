import 'package:flutter/material.dart';
import 'package:mycode/const.dart';
import 'package:mycode/pages/cart_page.dart';
import 'package:mycode/pages/shop_page.dart';
import 'package:mycode/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex=0;
  void navigateBottonBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  final List<Widget> _pages=[
    //shop page
    ShopPage(),
    //cart page
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottonNavBar(
        onTabChange: (index) =>navigateBottonBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
