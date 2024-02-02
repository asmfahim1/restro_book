import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/auth/login/controller/login_controller.dart';

class ProfileBodySectionWidget extends StatelessWidget {
  const ProfileBodySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: leftRightPadding15,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'Your stats',
                style: TextStyles.title16,
              ),
              const SizedBoxHeight10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _statsContainer('0', 'Reservations'),
                  _statsContainer('0', 'Reviews'),
                  _statsContainer('0', 'Photos'),
                ],
              ),
              const SizedBoxHeight20(),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    'Your points',
                    style: TextStyles.title16,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                  ),
                ],
              ),
              const SizedBoxHeight10(),
              RichText(
                text: TextSpan(
                  text:
                      'Start earning dining rewards by making a reservation.\n',
                  style: TextStyles.regular12.copyWith(color: blackColor),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Learn more',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              )*/
            ],
          ),
          InkWell(
            onTap: () {
              Get.toNamed(
                AppRoutes.accountSettingScreen,
              );
            },
            child: _settingAndPrivacyWidget('Account settings'),
          ),
          InkWell(
            onTap: () {
              /*Get.toNamed(
                AppRoutes.getAccountSetting(),
              );*/
            },
            child: _settingAndPrivacyWidget('Help & Support'),
          ),
          InkWell(
            onTap: () {
              /*Get.toNamed(
                AppRoutes.getAccountSetting(),
              );*/
            },
            child: _settingAndPrivacyWidget('Terms & Privacy'),
          ),
          SizedBox(
            height: Dimensions.height100 * .5,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                if (Get.find<LoginController>().userLoggedIn()) {
                  Get.find<LoginController>().clearSharedData();
                  Get.offAllNamed(AppRoutes.loginPage);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    'Sign Out',
                    style: TextStyles.title20.copyWith(color: primaryColor),
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                  const Icon(
                    Icons.login_outlined,
                    size: 25,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statsContainer(String number, String title) {
    return Column(
      children: [
        TextWidget(
          number,
          style: TextStyles.title16,
        ),
        const SizedBox(
          height: 5,
        ),
        TextWidget(
          title,
        ),
      ],
    );
  }

  Widget _settingAndPrivacyWidget(String titleName) {
    return Container(
      height: Dimensions.height60,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: strokeColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            titleName,
            style: TextStyles.title16,
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
          ),
        ],
      ),
    );
  }
}
