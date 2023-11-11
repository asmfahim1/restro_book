import 'package:flutter/material.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../../core/utils/exports.dart';

class CommonTitleWidgetWithViewAll extends StatelessWidget {
  final VoidCallback onTap;
  final String titleOfTheList;
  final bool isViewNeeded;
  const CommonTitleWidgetWithViewAll(
      {Key? key,
      required this.onTap,
      required this.titleOfTheList,
      this.isViewNeeded = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: leftRightPadding15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              titleOfTheList,
              style: TextStyles.title16,
            ),
            isViewNeeded
                ? TextWidget(
                    'VIEW ALL',
                    style: TextStyles.title16.copyWith(color: primaryColor),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
