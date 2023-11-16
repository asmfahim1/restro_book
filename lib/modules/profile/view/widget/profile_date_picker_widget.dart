import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class ProfileDatePickerWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final String selectedDate;
  final void Function() onTap;
  const ProfileDatePickerWidget({
    required this.title,
    required this.hintText,
    required this.selectedDate,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: Dimensions.height45,
          width: Dimensions.width100 * 1.15,
          padding: leftRightPadding10,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: profileContainerColor,
            borderRadius: radiusAll10,
          ),
          child: TextWidget(
            title,
            style: TextStyles.title32.copyWith(
              fontSize: 14,
              color: darkGrayColor,
            ),
          ),
        ),
        Container(
          height: Dimensions.height45,
          width: Dimensions.width100 * 2.5,
          padding: leftRightPadding10,
          decoration: BoxDecoration(
            color: profileContainerColor,
            borderRadius: radiusAll10,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
            onTap: onTap,
            readOnly: true,
            controller: TextEditingController(text: selectedDate),
          ),
        ),
      ],
    );
  }
}
