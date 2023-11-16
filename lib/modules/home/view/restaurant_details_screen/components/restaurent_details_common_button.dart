import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../../core/utils/exports.dart';

class ResDetailsCommonButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  const ResDetailsCommonButton(
      {super.key, required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding15,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          height: Dimensions.height50,
          width: Dimensions.screenWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: strokeColor, width: 1.2)),
          child: TextWidget(
            buttonName,
            style: TextStyles.title16,
          ),
        ),
      ),
    );
  }
}
