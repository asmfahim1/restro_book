import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/constant/constant_key.dart';
import 'package:restro_book/core/utils/api_client.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dialogue_utils.dart';
import 'package:restro_book/core/utils/extensions.dart';
import 'package:restro_book/core/utils/pref_helper.dart';
import 'package:restro_book/core/utils/urls.dart';
import 'package:restro_book/modules/auth/login/model/login_response_model.dart';

class LoginController extends GetxController {
  final apiClient = ApiClient();
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
      //map["examType"] = examType;
      Response response = await ApiClient().postData(Urls.loginUrl, map);
      if (response.statusCode == 200) {
        responseModel = LoginResponseModel.fromJson(response.body);
        if (responseModel!.data == null) {
          print('-------------- not null');
          closeLoading();
          DialogUtils.showMessageDialogue(
              title: 'Warning', description: '${responseModel!.message}');
        } else {
          print('-------------- null ');
          _setToken(responseModel!);
          closeLoading();
          Get.offAllNamed(AppRoutes.navBarScreen);
        }
      } else {
        print('--------------other statuscode: ${response.statusCode}');
        closeLoading();
        DialogUtils.showMessageDialogue();
      }
    } catch (e) {
      print('--------------');
      closeLoading();
      "There is an error occured while login request is processing: $e".log();
    }
  }

  void _setToken(LoginResponseModel responseModel) async {
    apiClient.token = responseModel.data?.token;
    apiClient.updateHeader(responseModel.data!.token.toString());
    await PrefHelper.setString(
      AppConstant.TOKEN.key,
      responseModel.data?.token ?? "",
    );
    await PrefHelper.setString(
      AppConstant.USER_ID.key,
      responseModel.data?.token ?? "",
    );
  }

  void closeLoading() {
    Get.back();
  }

  bool get passwordVisible => _passwordVisible.value;
}
