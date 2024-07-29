import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dialogue_utils.dart';
import 'package:restro_book/core/utils/extensions.dart';
import 'package:restro_book/modules/auth/login/model/login_response_model.dart';
import 'package:restro_book/modules/auth/login/repo/login_repo.dart';

class LoginController extends GetxController {
  LoginRepo? loginRepo;
  LoginController({this.loginRepo});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool _passwordVisible = false.obs;
  LoginResponseModel? responseModel;

  set passwordVisible(bool value) {
    _passwordVisible.value = value;
    update();
  }

  Future<void> loginMethod() async {
    try {
      DialogUtils.showLoading(title: "Please wait...");
      final map = <String, dynamic>{};
      map["email"] = email.text.trim();
      map["password"] = password.text.trim();
      Response response = await loginRepo!.login(map);
      print('========================${response.body}');
      if (response.statusCode == 200) {
        responseModel = LoginResponseModel.fromJson(response.body);
        if (responseModel!.data == null) {
          closeLoading();
          DialogUtils.showMessageDialogue(
              title: 'Warning', description: '${responseModel!.message}');
        } else {
          await loginRepo!.saveUserToken(responseModel!.data!.token.toString());
          closeLoading();
          Get.offAllNamed(AppRoutes.navBarScreen);
        }
      } else {
        //print('--------------other statuscode: ${response.statusCode}');
        closeLoading();
        DialogUtils.showMessageDialogue();
      }
    } catch (e) {
      //print('--------------');
      closeLoading();
      "There is an error occured while login request is processing: $e".log();
      rethrow;
    }
  }

  //ise user logged in
  bool userLoggedIn() {
    return loginRepo!.userLoggedIn();
  }

  bool clearSharedData() {
    return loginRepo!.clearSharedData();
  }

  void closeLoading() {
    Get.back();
  }

  bool get passwordVisible => _passwordVisible.value;
}
