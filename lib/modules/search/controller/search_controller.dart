import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/string_resource.dart';

class SearchFieldController extends GetxController {
  RxBool showShadow = false.obs;
  final RxInt _noOfMember = 1.obs;
  final RxInt _selectedMemberIndex = 0.obs;
  final RxBool _switchActive1 = false.obs;
  final RxBool _switchActive2 = false.obs;
  final Rx<DateTime> _dateTime = DateTime.now().obs;

  ///booking_confirm_screen
  TextEditingController specialRequestController = TextEditingController();
  ScrollController scrollController = ScrollController();

  set switchActive1(bool value) {
    _switchActive1.value = value;
  }

  set switchActive2(bool value) {
    _switchActive2.value = value;
  }

  set dateTime(DateTime value) {
    _dateTime.value = value;
  }

  List<String> listOfCategories = categories;

  // late List<ProductCategory> listCategory;

  List<double> listOffsetItemHeader = [];

  @override
  void onInit() {
    super.onInit();
  }

  set noOfMember(int value) {
    _noOfMember.value = value;
    update();
  }

  void setSelectedMember(int index) {
    _selectedMemberIndex.value = index;
    noOfMember = index + 1;
    scrollController.animateTo((index) * 65,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn);
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int get noOfMember => _noOfMember.value;
  int get selectedMemberIndex => _selectedMemberIndex.value;
  bool get switchActive1 => _switchActive1.value;
  bool get switchActive2 => _switchActive2.value;
  DateTime get dateTime => _dateTime.value;
}
