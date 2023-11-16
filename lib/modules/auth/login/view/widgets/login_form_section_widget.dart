import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/const.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/modules/auth/login/controller/login_controller.dart';

import '../../../../../core/utils/asset_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/common_button.dart';
import '../../../../../core/widgets/common_text_field_widget.dart';
import '../../../../../core/widgets/sized_box_height_10.dart';
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
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        height: Dimensions.screenHeight * .5,
        width: size.width,
        padding: leftRightPadding10,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBoxHeight20(),
            _textFields(),
            SizedBox(
              height: Dimensions.height15,
            ),
            const SizedBoxHeight20(),
            _loginButton(),
            const SizedBoxHeight20(),
            _socialLogin(),
            const SizedBoxHeight10(),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.registrationPage);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget('Don\'t have an account?',
                      style: TextStyles.title16.copyWith(color: whiteColor)),
                  TextWidget(
                    'Sign Up',
                    style: TextStyles.title16.copyWith(color: primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
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
      height: Dimensions.height50,
      width: Dimensions.width225,
      buttonTitle: 'Login',
      onPressed: () {
        //login method will call
        Get.toNamed(AppRoutes.getNavBarScreen());
      },
    );
  }

  Widget _socialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _socialItem(
          title: 'Facebook',
          iconPath: facebookIconPath,
          callBack: () {},
        ),
        SizedBox(
          width: Dimensions.width10,
        ),
        _socialItem(
          title: 'Google',
          iconPath: googleIconPath,
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
        height: Dimensions.height60,
        width: Dimensions.width135,
        decoration: BoxDecoration(
          color: silverGrayColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: allPadding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: whiteColor,
                backgroundImage: AssetImage(iconPath),
                radius: 15,
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              TextWidget(
                title,
                style: TextStyles.regular14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
