import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';

class DietPreferencesWidget extends StatelessWidget {
  const DietPreferencesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: Dimensions.height35,
          alignment: Alignment.centerLeft,
          child: TextWidget(
            'Diet Preferences',
            style: TextStyles.title16.copyWith(color: primaryColor),
          ),
        ),
        const SizedBoxHeight10(),
        Wrap(
          spacing: 8.0, // Horizontal spacing between items
          runSpacing: 8.0, // Vertical spacing between rows
          children: [
            _dietNameWidget('Pescatarian'),
            _dietNameWidget('Vegetarian'),
            _dietNameWidget('Vegan'),
            _dietNameWidget('No red meat'),
            _dietNameWidget('Gluten-free'),
            _dietNameWidget('Diary-free'),
            _dietNameWidget('Nut-free'),
            _dietNameWidget('Halal'),
            _dietNameWidget('Keto'),
          ],
        ),
      ],
    );
  }

  Widget _dietNameWidget(String title) {
    return Container(
      height: Dimensions.height10 * 2.5,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: strokeColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextWidget(
        title,
        style: TextStyles.regular12.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
