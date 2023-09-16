import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int tabIndex = 3;
  late TabController tabController;
  final RxInt _currentIndex = 0.obs;
  set currentIndex(int index) {
    _currentIndex.value = index;
    update();
  }

  void toggleTab() {
    tabIndex = tabController.index + 1;
    tabController.animateTo(tabIndex);
    update();
  }

  int get currentIndex => _currentIndex.value;
}
