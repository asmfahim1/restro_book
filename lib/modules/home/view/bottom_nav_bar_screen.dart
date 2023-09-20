import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';

import '../../../core/utils/colors.dart';
import '../../search/view/search_screen.dart';
import 'home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  HomeController home = Get.put(HomeController());
  final List _tabs = [
    const HomeScreen(),
    const SearchScreen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return _tabs[controller.currentIndex];
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (index) {
              controller.currentIndex = index;
            },
            elevation: 2,
            selectedItemColor: primaryColor,
            unselectedItemColor: strokeColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history_outlined,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: 'Notifications',
              ),
            ],
          );
        },
      ),
    );
  }
}
