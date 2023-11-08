import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/const.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/modules/auth/registration/view/widgets/registration_form_widget.dart';
import '../../../../core/utils/asset_path.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/sized_box_height_20.dart';
import '../../../../core/widgets/text_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'Registration for more features',
                  style: TextStyles.title22.copyWith(color: whiteColor),
                ),
                const SizedBoxHeight20(),
                const RegistrationFormSectionWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
