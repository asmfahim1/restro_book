import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/string_resource.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/connom_title_widget.dart';
import 'package:restro_book/modules/home/view/widget/title_with_listView_widget.dart';

class AvailableForCurrentTimeWidget extends StatelessWidget {
  AvailableForCurrentTimeWidget({Key? key}) : super(key: key);

  final DateTime dateTime = DateTime.now();
  String determineMeal() {
    int currentHour = dateTime.hour;
    if (currentHour >= 6 && currentHour < 12) {
      return 'Breakfast';
    } else if (currentHour >= 12 && currentHour < 18) {
      return 'Lunch';
    } else if (currentHour >= 18 && currentHour < 24) {
      return 'Dinner';
    } else {
      return 'Unknown Meal';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String mealName = determineMeal();
    return SizedBox(
      height: Dimensions.height300 + Dimensions.height10,
      width: Dimensions.screenWidth,
      child: Column(
        children: [
          CommonTitleWidgetWithViewAll(
            titleOfTheList: 'Available for $mealName',
            onTap: () {
              Get.toNamed(AppRoutes.getViewAllScreen());
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];
                return TitleWithListViewWidget(
                  onTap: () {
                    Get.toNamed(AppRoutes.getResDetailsScreen(
                        restaurant['restaurantName'].toString(),
                        '110302$restaurant'));
                  },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory:
                      restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: Dimensions.height20 + Dimensions.height5,
                  timeContainerWidth: Dimensions.width50 + Dimensions.width20,
                  startTime: '11:30 AM',
                  startPts: '+ 326 pts',
                  midTime: '12:30 PM',
                  midPts: 'Experience',
                  endTime: '01:00 PM',
                  endPts: '+ 750 pts',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
