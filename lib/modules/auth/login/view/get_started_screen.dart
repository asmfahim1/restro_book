import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _topSectionWidget(),
          _bottomSectionWidget(),
        ],
      ),
    );
  }

  Widget _topSectionWidget() {
    return Container(
      height: Dimensions.heightScreenHalf,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(restroBookImagePath),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _bottomSectionWidget() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.loginPage);
        },
        child: Container(
          color: primaryColor,
          child: Column(
            children: [
              Container(
                height: Dimensions.heightScreenHalf * .85,
                padding: allPadding20,
                child: Column(
                  children: [
                    TextWidget(
                      'Dine out like a local',
                      style: TextStyles.title20.copyWith(color: whiteColor),
                    ),
                    SizedBoxHeight20(),
                    TextWidget(
                      'Restro booking uses your location to help you find great restaurants at home or on the road.',
                      style: TextStyles.regular14.copyWith(color: whiteColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: Dimensions.screenWidth,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: blackColor,
                        width: 1.2,
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: TextWidget(
                    'Next',
                    style: TextStyles.regular18.copyWith(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
