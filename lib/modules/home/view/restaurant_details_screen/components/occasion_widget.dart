import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';

class OccasionWidget extends StatelessWidget {
  final String title;
  final ReservationController reservationController;

  OccasionWidget({
    Key? key,
    required this.title,
    required this.reservationController,
  }) : super(key: key);

  final List<String> occasions = ['Birthday', 'Anniversary', 'Date', 'Special Occasion', 'Business Meal'];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: Dimensions.height35,
          alignment: Alignment.centerLeft,
          child: TextWidget(
            title,
            style: TextStyles.title16,
          ),
        ),
        const SizedBoxHeight10(),
        Wrap(
          spacing: 4.0,
          runSpacing: 8.0,
          children: occasions.map((occasion) {
            return Obx((){
              return _occasionNameWidget(
                title: occasion,
                isSelected: occasion == reservationController.selectedOccasion.value,
                onSelectedOccasion: () {
                  reservationController.selectOccasion(occasion);
                  print('occasion name is : ${reservationController.selectedOccasion.value}');
                },
              );
            });
          }).toList(),
        ),
      ],
    );
  }

  Widget _occasionNameWidget({required String title, required bool isSelected, required VoidCallback onSelectedOccasion}){
    return InkWell(
      onTap: onSelectedOccasion,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: Dimensions.height10 * 2.5,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? primaryColor : strokeColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextWidget(
          title,
          style: TextStyles.regular12.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
