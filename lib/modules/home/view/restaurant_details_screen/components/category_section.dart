import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/components/sliver_body_item.dart';

class CategorySection extends StatelessWidget {
  final int index;
  final String resName;
  final String resId;
  final ReservationController controller;

  const CategorySection({
    Key? key,
    required this.index,
    required this.controller,
    required this.resName,
    required this.resId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 10.0),
      //margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTileHeader(context, controller),
          SliverBodyItems(
            categoryIndex: controller.listOfCategories[index],
            controller: controller,
            resName: resName,
            resId: resId,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTileHeader(
      BuildContext context, ReservationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimensions.height10),
        _sectionTitle(context, controller),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context, ReservationController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Text(
            controller.listOfCategories[index],
            style: TextStyles.title16,
            //strutStyle: Helper.buildStrutStyle(_textTheme(context).headline6),
          )
        ],
      ),
    );
  }
}
