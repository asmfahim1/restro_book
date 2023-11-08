import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class NearbyRestaurantContainerWidget extends StatelessWidget {
  const NearbyRestaurantContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: Dimensions.height30,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      child: TextWidget(
        '176 Restaurants nearby',
        style: TextStyles.title16.copyWith(fontSize: 11),
      ),
    );
  }
}
