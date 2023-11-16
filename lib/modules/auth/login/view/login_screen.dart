import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/auth/login/view/widgets/login_form_section_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        'Screen height : ${Dimensions.screenHeight} -----width: ${Dimensions.screenWidth}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Dimensions.screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(loginBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: allPadding20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  'Welcome to RESTRO BOOKING',
                  style: TextStyles.title22.copyWith(color: whiteColor),
                ),
                const SizedBoxHeight20(),
                const LoginFormSectionWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
