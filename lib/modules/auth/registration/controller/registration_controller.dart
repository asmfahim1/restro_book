import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dialogue_utils.dart';
import 'package:restro_book/core/utils/extensions.dart';
import 'package:restro_book/modules/auth/registration/model/registration_response_model.dart';
import 'package:restro_book/modules/auth/registration/repo/registration_repo.dart';

class RegistrationController extends GetxController {
  RegistrationRepo? registrationRepo;
  RegistrationController({this.registrationRepo});

  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool _passwordVisible = false.obs;
  RegistrationResponseModel? responseModel;

  set passwordVisible(bool value) {
    _passwordVisible.value = value;
    update();
  }

  Future<void> registrationMethod() async {
    try {
      DialogUtils.showLoading(title: "Please wait...");
      final map = <String, dynamic>{};
      map["name"] = userName.text.trim();
      map["email"] = email.text.trim();
      map["password"] = password.text.trim();
      //map["examType"] = examType;
      Response response = await registrationRepo!.registration(map);
      if (response.statusCode == 200) {
        responseModel = RegistrationResponseModel.fromJson(response.body);
        if (responseModel!.data == null) {
          print('-------------- not null');
          closeLoading();
          DialogUtils.showMessageDialogue(
            title: 'Warning',
            description: '${responseModel!.message}',
          );
        } else {
          print('-------------- null ');
          //_setToken(responseModel!);
          closeLoading();
          DialogUtils.showSnackBar(
              'Successful', 'Congratulations! for completing registration');
          Get.offAllNamed(AppRoutes.loginPage);
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

  void closeLoading() {
    Get.back();
  }

  bool get passwordVisible => _passwordVisible.value;
}
