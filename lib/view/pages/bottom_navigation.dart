import 'package:fassion_fold/view/pages/home.dart';
import 'package:fassion_fold/view/pages/my_bag.dart';
import 'package:fassion_fold/view/pages/products.dart';
import 'package:fassion_fold/view/pages/saved_items.dart';
import 'package:fassion_fold/view_model/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavBarState>(
        builder: (context, bottomNavbarState, child) {
          return IndexedStack(
            index: bottomNavbarState.selectedIndex,
            children: [
              HomePage(),
              Products(),
              MyBag(),
              SavedItems(),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<BottomNavBarState>(
          builder: (context, bottomNavBarState, child) {
        return BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: bottomNavBarState.selectedIndex,
            onTap: (index) {
              bottomNavBarState.setIndex(index);
            },
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(IconlyLight.home, color: Colors.black),
                  label: 'Home'),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(IconlyLight.bookmark, color: Colors.black),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(IconlyLight.bag_2, color: Colors.black),
                label: 'My Bag',
              ),
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(IconlyLight.heart, color: Colors.black),
                  label: 'Saved Items'),
            ]);
      }),
    );
  }
}
