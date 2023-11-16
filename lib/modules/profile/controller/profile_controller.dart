import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  final RxString _gender = 'Male'.obs;
  final RxString dateOfBirth = DateFormat.yMMMd().format(DateTime.now()).obs;

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

  String get gender => _gender.value;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get specialRequestController =>
      _specialRequestController;
}
