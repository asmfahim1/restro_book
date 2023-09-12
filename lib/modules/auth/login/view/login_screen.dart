import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/asset_path.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/auth/login/view/widgets/login_form_section_widget.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(loginBackgroundImage),
              fit: BoxFit.cover,
              opacity: 0.6,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBoxHeight20(),
                const SizedBoxHeight20(),
                const SizedBoxHeight20(),
                TextWidget('Welcome to restro_book', style: TextStyles.title22.copyWith(color: whiteColor),),
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
