import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../core/utils/exports.dart';

class ProfileDropdownWidget extends StatelessWidget {
  final String title;
  final String selectedItem;
  final List<String> itemList;
  final void Function(String?)? onChanged;
  const ProfileDropdownWidget({
    required this.title,
    required this.selectedItem,
    required this.itemList,
    this.onChanged,
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
          child: DropdownButtonFormField<String>(
            value: selectedItem,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
            ),
            items: itemList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: TextWidget(
                  value,
                  style: TextStyles.regular16,
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
