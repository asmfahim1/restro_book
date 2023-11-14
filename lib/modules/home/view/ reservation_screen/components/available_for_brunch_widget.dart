import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/connom_title_widget.dart';
import 'package:restro_book/modules/home/view/widget/title_with_listView_widget.dart';

class AvailableForBrunchWidget extends StatelessWidget {
  final HomeController homeController;
  const AvailableForBrunchWidget({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height300 + Dimensions.height10,
      width: Dimensions.screenWidth,
      child: Column(
        children: [
          CommonTitleWidgetWithViewAll(
            titleOfTheList: 'Available for brunch',
            onTap: () {
              Get.toNamed(AppRoutes.getViewAllScreen());
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: availableForBrunchList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = availableForBrunchList[index];
                return TitleWithListViewWidget(
                  onTap: () {
                    Get.toNamed(AppRoutes.getResDetailsScreen(
                        restaurant['restaurantName'].toString(),
                        '110302$restaurant'));
                  },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  bookMarkButton: Obx(() {
                    bool isSaved = homeController.savedList.any((savedItem) =>
                        restaurant['restaurantID'] == savedItem.resId);
                    return IconButton(
                        onPressed: () {
                          homeController.addToSavedList(restaurant);
                        },
                        icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          size: 20,
                        ),
                        color: primaryColor);
                  }),
                  restaurantCategory:
                      restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: Dimensions.height20 + Dimensions.height5,
                  timeContainerWidth: Dimensions.width50 + Dimensions.width20,
                  startTime: '11:30 AM',
                  //startPts: '+ 326 pts',
                  midTime: '12:30 PM',
                  //midPts: 'Experience',
                  endTime: '01:00 PM',
                  //endPts: '+ 750 pts',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
