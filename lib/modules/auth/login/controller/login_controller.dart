import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool _passwordVisible = false.obs;

  set passwordVisible(bool value) {
    _passwordVisible.value = value;
    update();
  }

  bool get passwordVisible => _passwordVisible.value;

  Future<void> loginReq(BuildContext context) async{
    final map = <String, dynamic>{};
    map["name"] = name.text;
    map["email"] = email.text;
    map["password"] = password.text;


  }
}
