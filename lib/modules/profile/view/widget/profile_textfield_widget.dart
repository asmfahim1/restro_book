import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class ProfileTextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  const ProfileTextFieldWidget({
    required this.title,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: Dimensions.height45,
          width: Dimensions.width100,
          padding: leftRightPadding10,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(
              color: strokeColor,
            ),
            borderRadius: BorderRadius.circular(6),
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
          width: Dimensions.width100 * 2,
          padding: leftRightPadding10,
          decoration: BoxDecoration(
            border: Border.all(
              color: strokeColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
            onFieldSubmitted: onFieldSubmitted,
          ),
        ),
      ],
    );
  }
}
