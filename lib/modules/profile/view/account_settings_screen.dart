import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

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
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      padding: allPadding15,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _settingsSectionWidget(Icons.person_outlined, 'Account Details',
                'Manage account details', () {}),
            const SizedBoxHeight10(),
            _settingsSectionWidget(Icons.payment_outlined, 'Payment Methods',
                'Manage payment methods', () {}),
            const SizedBoxHeight10(),
            _settingsSectionWidget(Icons.phone_android_outlined,
                'Communications', 'Emails, texts and notifications', () {}),
            const SizedBoxHeight10(),
            _settingsSectionWidget(
                Icons.newspaper, 'Distance Units', 'Automatic', () {}),
            const SizedBoxHeight10(),
            _settingsSectionWidget(Icons.question_mark_outlined,
                'Help and Support', 'Support and FAQs', () {}),
            const SizedBoxHeight10(),
            _settingsSectionWidget(Icons.info_rounded, 'Terms and Privacy',
                'Manage account details', () {}),
            const SizedBoxHeight10(),
          ],
        ),
      ),
    );
  }

  Widget _settingsSectionWidget(
      IconData icon, String title, String subTitle, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Dimensions.height60,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: strokeColor),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: primaryColor,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  title,
                  style: TextStyles.title16,
                ),
                TextWidget(
                  subTitle,
                  style: TextStyles.regular14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
