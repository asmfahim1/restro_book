import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/styles.dart';
import 'package:restro_book/core/widgets/exports.dart';

class SpecialAlert extends StatelessWidget {
  final String? headTitle;
  final String? message;
  final String? btnText;
  const SpecialAlert({Key? key, this.headTitle, this.message, this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          headTitle!,
          style: TextStyles.title22,
        ),
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            Image.asset(
              "assets/icons/Successdesign.gif",
              height: Dimensions.height100,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              message!,
              style: TextStyles.title16,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          onPressed: () {
            /* Navigator.pop(context, 'Back');
            Navigator.pop(context, 'Back');
            Navigator.pop(context, 'Back');*/
            Get.back();
            Get.back();
          },
          child: Text(
            btnText!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
