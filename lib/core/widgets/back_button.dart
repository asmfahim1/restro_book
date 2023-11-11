import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';

import '../utils/colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SizedBox(
        height: Dimensions.height50 + Dimensions.height5,
        width: Dimensions.width50 + 5,
        child: Center(
          child: SizedBox(
            width: Dimensions.width15 + Dimensions.width10,
            height: Dimensions.height20 + Dimensions.height10,
            child: const Icon(
              Icons.arrow_back_outlined,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
