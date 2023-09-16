import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _topSectionWidget(context),
          _bottomSectionWidget(context),
        ],
      ),
    );
  }

  Widget _topSectionWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(restroBookImagePath),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _bottomSectionWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                height: size.height / 2.4,
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
                  width: size.width,
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
