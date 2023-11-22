import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/extensions.dart';

class ProfileController extends GetxController {
  final RxString _gender = 'Male'.obs;
  final RxString dateOfBirth = DateFormat.yMMMd().format(DateTime.now()).obs;
  final RxString anniversary = DateFormat.yMMMd().format(DateTime.now()).obs;
  RxString selectedImagePath = ''.obs;
  RxString selectedImageSize = ''.obs;
  RxList selectedDiets = <String>[].obs;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _specialRequestController = TextEditingController();

  set gender(String value) {
    _gender.value = value;
    update();
  }

  void selectDateOfBirth(DateTime dateTime) {
    dateOfBirth.value = DateFormat.yMMMd().format(
      DateTime.parse(
        dateTime.toString(),
      ),
    );
    update();
  }

  void anniversaryDate(DateTime dateTime) {
    anniversary.value = DateFormat.yMMMd().format(
      DateTime.parse(
        dateTime.toString(),
      ),
    );
    update();
  }

  set firstNameController(TextEditingController value) {
    _firstNameController = value;
    update();
  }

  set lastNameController(TextEditingController value) {
    _lastNameController = value;
    update();
  }

  set emailController(TextEditingController value) {
    _emailController = value;
    update();
  }

  set phoneController(TextEditingController value) {
    _phoneController = value;
    update();
  }

  set specialRequestController(TextEditingController value) {
    _specialRequestController = value;
    update();
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
      //image size converted to MB
      selectedImageSize.value =
          '${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} MB';
      Get.back();
      "the size of the image is: $selectedImageSize".log();
    } else {
      Get.back();
      Get.snackbar('Warning!', 'No image selected from device',
          snackPosition: SnackPosition.TOP,
          backgroundColor: redColor,
          colorText: whiteColor,
          duration: const Duration(seconds: 2));
    }
  }

  /// for account settings diet option toggling
  void toggleDiet(String diet) {
    if (selectedDiets.contains(diet)) {
      selectedDiets.remove(diet);
    } else {
      selectedDiets.add(diet);
    }
  }


  String get gender => _gender.value;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get specialRequestController =>
      _specialRequestController;
}
