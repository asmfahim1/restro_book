import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/auth/registration/controller/registration_controller.dart';

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
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneNumFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: Dimensions.screenHeight * .645,
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
            FocusScope.of(context).requestFocus(_emailFocus);
          },
        ),
        const SizedBoxHeight20(),
        CommonTextField(
          hintText: 'Email address',
          validator: Validator().nullFieldValidate,
          controller: regiController.email,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(_phoneNumFocus);
          },
        ),
        const SizedBoxHeight20(),
        CommonTextField(
          hintText: 'Phone number',
          validator: Validator().nullFieldValidate,
          controller: regiController.phone,
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
            controller: regiController.password,
            obSecure: !regiController.passwordVisible,
            onFieldSubmitted: (v) {
              //login method will call
              if (_formKey.currentState!.validate()) {
                regiController.registrationMethod();
              }
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
        if (_formKey.currentState!.validate()) {
          regiController.registrationMethod();
        }
      },
    );
  }
}
