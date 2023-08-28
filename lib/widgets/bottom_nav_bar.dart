import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottonNavBar extends StatelessWidget {
   void Function(int)? onTabChange;

   MyBottonNavBar({
    super.key,
    required this.onTabChange,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
        onTabChange:(value) => onTabChange!(value) ,
          color: Colors.grey[400],
          mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Colors.grey.shade300,
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.white),
          activeColor: Colors.grey[700],
          tabs:[
            GButton(
                icon: Icons.home,
                text: 'shop',
            ),
            GButton(
                icon: Icons.shopping_bag_outlined,
                text: 'cart',
            ),
          ]

      ),
    );
  }
}
