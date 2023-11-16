import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/profile/controller/profile_controller.dart';
import 'package:restro_book/modules/profile/view/widget/diet_preferences.dart';
import 'package:restro_book/modules/profile/view/widget/profile_date_picker_widget.dart';
import 'package:restro_book/modules/profile/view/widget/profile_dropdown_widget.dart';
import 'package:restro_book/modules/profile/view/widget/profile_textfield_widget.dart';
import 'package:restro_book/modules/profile/view/widget/special_request_textfield.dart';

class AccountSettingsScreen extends StatelessWidget {
  AccountSettingsScreen({super.key});

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: whiteColor,
            )),
        title: TextWidget(
          'Settings',
          style: TextStyles.title20.copyWith(color: whiteColor),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: TextWidget(
                'Done',
                style: TextStyles.title16.copyWith(color: whiteColor),
              ))
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SizedBox(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              _firstName(),
              const SizedBoxHeight20(),
              _lastName(),
              const SizedBoxHeight20(),
              _email(),
              const SizedBoxHeight20(),
              _contactNumber(),
              const SizedBoxHeight20(),
              _genderDropDown(),
              const SizedBoxHeight20(),
              _dateOfBirth(context),
              const SizedBoxHeight20(),
              const DietPreferencesWidget(),
              const SizedBoxHeight20(),
              _specialRequest(),
              const SizedBoxHeight20(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderDropDown() {
    return ProfileDropdownWidget(
      title: 'Gender',
      selectedItem: profileController.gender,
      itemList: genders,
      onChanged: (value) {
        profileController.gender = value.toString();
      },
    );
  }

  Widget _dateOfBirth(BuildContext context) {
    return Obx(
      () => ProfileDatePickerWidget(
        title: 'Date of Birth',
        hintText: profileController.dateOfBirth.value,
        selectedDate: profileController.dateOfBirth.value,
        onTap: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (selectedDate != null) {
            profileController.selectDateOfBirth(selectedDate);
          }
        },
      ),
    );
  }

  Widget _firstName() {
    return ProfileTextFieldWidget(
      title: 'First name',
      hintText: 'Skyler',
      controller: profileController.firstNameController,
      validator: Validator().nullFieldValidate,
      onFieldSubmitted: (v) {},
    );
  }

  Widget _lastName() {
    return ProfileTextFieldWidget(
      title: 'Last name',
      hintText: 'Sophie',
      controller: profileController.firstNameController,
      validator: Validator().nullFieldValidate,
      onFieldSubmitted: (v) {},
    );
  }

  Widget _email() {
    return ProfileTextFieldWidget(
      title: 'Email',
      hintText: 'sophie@gmail.com',
      controller: profileController.emailController,
      validator: Validator().nullFieldValidate,
      onFieldSubmitted: (v) {},
    );
  }

  Widget _contactNumber() {
    return ProfileTextFieldWidget(
      title: 'Contact',
      hintText: '+052-111222666',
      controller: profileController.emailController,
      validator: Validator().nullFieldValidate,
      onFieldSubmitted: (v) {},
    );
  }

  Widget _specialRequest() {
    return SpecialRequestField(
      hintText: 'Add special request here...',
      controller: profileController.specialRequestController,
    );
  }
}
