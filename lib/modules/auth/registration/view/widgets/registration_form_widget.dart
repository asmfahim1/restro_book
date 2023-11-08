import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/auth/registration/controller/registration_controller.dart';

import '../../../../../core/widgets/common_button.dart';
import '../../../../../core/widgets/common_text_field_widget.dart';
import '../../../../../core/widgets/sized_box_height_20.dart';

class RegistrationFormSectionWidget extends StatefulWidget {
  const RegistrationFormSectionWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationFormSectionWidget> createState() =>
      _RegistrationFormSectionWidgetState();
}

class _RegistrationFormSectionWidgetState
    extends State<RegistrationFormSectionWidget> {
  final regiController = Get.put(RegistrationController());
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: Dimensions.heightScreenHalf ,
        width: Dimensions.screenWidth,
        padding: leftRightPadding10,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textFields(),
            SizedBox(
              height: Dimensions.height15,
            ),
            const SizedBoxHeight20(),
            _registrationButton(),
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
          hintText: 'User name',
          validator: Validator().nullFieldValidate,
          controller: regiController.userName,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(_passwordFocus);
          },
        ),
        const SizedBoxHeight10(),
        CommonTextField(
          hintText: 'Email address',
          validator: Validator().nullFieldValidate,
          controller: regiController.email,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(_passwordFocus);
          },
        ),
        const SizedBoxHeight10(),
        CommonTextField(
          hintText: 'Phone number',
          validator: Validator().nullFieldValidate,
          controller: regiController.phone,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(_passwordFocus);
          },
        ),
        const SizedBoxHeight10(),
        Obx(() {
          return CommonTextField(
            validator: Validator().nullFieldValidate,
            hintText: 'Password',
            focusNode: _passwordFocus,
            controller: regiController.password,
            obSecure: !regiController.passwordVisible,
            onFieldSubmitted: (v) {
              //login method will call
            },
            suffixIcon: IconButton(
              color: blackColor,
              icon: regiController.passwordVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                regiController.passwordVisible =
                    !regiController.passwordVisible;
              },
            ),
          );
        }),
      ],
    );
  }

  Widget _registrationButton() {
    return CommonButton(
      height: Dimensions.height50,
      width: Dimensions.width225,
      buttonTitle: 'Registration',
      onPressed: () {
        //login method will call
        Get.offAllNamed(AppRoutes.loginPage);
      },
    );
  }
}
