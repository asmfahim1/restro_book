import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/profile/controller/profile_controller.dart';

class DietPreferencesWidget extends StatelessWidget {
  final ProfileController profileController;
  DietPreferencesWidget({
    super.key, required this.profileController,
  });

  final List<String> diets = [
    'Pescatarian',
    'Vegetarian',
    'Vegan',
    'No red meat',
    'Gluten-free',
    'Diary-free',
    'Nut-free',
    'Halal',
    'Keto',
  ];

  @override
  Widget build(BuildContext context) {
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
          spacing: 4.0,
          runSpacing: 8.0,
          children: diets.map((diet) {
            return Obx((){
              return _dietNameWidget(
                diet: diet,
                isSelected: profileController.selectedDiets.contains(diet),
                onSelectedDiet: () {
                  profileController.toggleDiet(diet);
                },
              );
            });
          }).toList(),
        ),
      ],
    );
  }

  Widget _dietNameWidget({required String diet, required bool isSelected, required VoidCallback onSelectedDiet}){
    return InkWell(
      onTap: onSelectedDiet,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: Dimensions.height10 * 2.5,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? primaryColor : strokeColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextWidget(
          diet,
          style: TextStyles.regular12.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
