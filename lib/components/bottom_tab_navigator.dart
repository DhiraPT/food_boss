import 'package:flutter/material.dart';
import 'package:food_boss/components/bottom_nav_bar.dart';
import 'package:food_boss/screens/home_screen/home_screen.dart';
import 'package:food_boss/screens/profile_screen.dart';
import 'package:food_boss/screens/resource_screen.dart';

class BottomTabNavigator extends StatefulWidget {
  const BottomTabNavigator({Key? key}) : super(key: key);

  @override
  State<BottomTabNavigator> createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  int pageIndex = 0;

  List pages = [
    const HomeScreen(),
    const ResourceScreen(),
    const ProfileScreen()
  ];

  void onNavButtonTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: pages[pageIndex],
              bottomNavigationBar: BottomNavBar(
                  pageIndex: pageIndex, onNavButtonTapped: onNavButtonTapped),
            )));
  }
}
