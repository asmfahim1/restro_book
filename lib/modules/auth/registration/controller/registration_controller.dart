import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool _passwordVisible = false.obs;

  set passwordVisible(bool value) {
    _passwordVisible.value = value;
    update();
  }

  bool get passwordVisible => _passwordVisible.value;
}
