import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/exports.dart';
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
        height: MediaQuery.of(context).size.height / 1.9,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBoxHeight20(),
            _textFields(),
            const SizedBox(
              height: 15,
            ),
            const SizedBoxHeight20(),
            _registrationButton(),
            const SizedBoxHeight20(),
            const SizedBoxHeight20(),
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
        const SizedBoxHeight20(),
        CommonTextField(
          hintText: 'Email address',
          validator: Validator().nullFieldValidate,
          controller: regiController.email,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(_passwordFocus);
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
      btnHeight: MediaQuery.of(context).size.width / 20,
      width: MediaQuery.of(context).size.width / 1.6,
      buttonTitle: 'Registration',
      onTap: () {
        //login method will call
        Get.offAllNamed(AppRoutes.loginPage);
      },
    );
  }
}
