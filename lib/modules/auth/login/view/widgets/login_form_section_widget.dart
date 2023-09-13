import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/modules/auth/login/controller/login_controller.dart';

import '../../../../../core/utils/asset_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/common_button.dart';
import '../../../../../core/widgets/common_icon_widget.dart';
import '../../../../../core/widgets/common_text_field_widget.dart';
import '../../../../../core/widgets/sized_box_height_20.dart';
import '../../../../../core/widgets/text_widget.dart';

class LoginFormSectionWidget extends StatefulWidget {
  const LoginFormSectionWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormSectionWidget> createState() => _LoginFormSectionWidgetState();
}

class _LoginFormSectionWidgetState extends State<LoginFormSectionWidget> {
  final login = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBoxHeight20(),
          _textFields(),
          const SizedBox(
            height: 15,
          ),
          const SizedBoxHeight20(),
          _loginButton(),
          const SizedBoxHeight20(),
          _socialLogin(),
          const SizedBoxHeight20(),
          GestureDetector(
            onTap: () {
              //go to registration page
              Get.toNamed(AppRoutes.registrationPage);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget('Don\'t have an account?',
                    style: TextStyles.title16.copyWith(color: blackColor)),
                TextWidget(
                  'Sign Up',
                  style: TextStyles.title16.copyWith(color: whiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextField(
          hintText: 'Email',
          validator: Validator().nullFieldValidate,
          controller: login.email,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(_passwordFocus);
          },
        ),
        const SizedBoxHeight20(),
        Obx(() {
          return CommonTextField(
            validator: Validator().nullFieldValidate,
            hintText: 'Password',
            focusNode: _passwordFocus,
            controller: login.password,
            obSecure: !login.passwordVisible,
            onFieldSubmitted: (v) {
              //login method will call
            },
            suffixIcon: IconButton(
              color: blackColor,
              icon: login.passwordVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                login.passwordVisible = !login.passwordVisible;
              },
            ),
          );
        }),
      ],
    );
  }

  Widget _loginButton() {
    return CommonButton(
      btnHeight: MediaQuery.of(context).size.width / 20,
      width: MediaQuery.of(context).size.width / 1.6,
      buttonTitle: 'Login',
      onTap: () {
        //login method will call
      },
    );
  }

  Widget _socialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialItem(
          title: 'Facebook',
          iconPath: facebookIconPath,
          callBack: () {},
        ),
        const SizedBox(
          width: 20,
        ),
        _socialItem(
          title: 'Google',
          iconPath: facebookIconPath,
          callBack: () {},
        ),
      ],
    );
  }

  Widget _socialItem({
    required String title,
    required String iconPath,
    required VoidCallback callBack,
  }) {
    return InkWell(
      onTap: callBack,
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width / 2 - 30,
        decoration: BoxDecoration(
          color: silverGrayColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonIconWidget(
                iconPath,
                width: 35,
                height: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              TextWidget(
                title,
                style: TextStyles.regular16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
