import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 120,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text('Food Expiry Date Tracker'),
      titleSpacing: 15.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)
          ),
          color: Color.fromRGBO(0, 110, 23, 1)
        )
      ),
    );
  }
}
