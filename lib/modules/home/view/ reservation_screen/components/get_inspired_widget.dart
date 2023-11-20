import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/connom_title_widget.dart';
import 'package:restro_book/modules/home/view/widget/title_with_listView_widget.dart';

class GetInspiredWidget extends StatelessWidget {
  const GetInspiredWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height300 + Dimensions.height10,
      width: Dimensions.screenWidth,
      child: Column(
        children: [
          CommonTitleWidgetWithViewAll(
            titleOfTheList: 'Get inspired',
            onTap: () {
              Get.toNamed(AppRoutes.viewAllRestaurants);
            },
            isViewNeeded: false,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getInspiredList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = getInspiredList[index];
                return TitleWithListViewWidget(
                  onTap: () {
                    var map = <String, String>{};
                    map = {
                      'resName': restaurant['restaurantName'].toString(),
                      'resId': restaurant['restaurantID'].toString(),
                      'resReviews': restaurant['restaurantReviews'].toString(),
                      'resAddress': restaurant['restaurantAddress'].toString(),
                      'resPricing': restaurant['restaurantPriceRang'].toString(),
                      'resMetro': restaurant['restaurantMetro'].toString(),
                      'resCuisines': restaurant['restaurantCuisines'].toString(),
                    };
                    Get.toNamed(
                        AppRoutes.resDetailsScreen,
                        arguments: {
                          'resName': restaurant['restaurantName'].toString(),
                          'resId': restaurant['restaurantID'].toString(),
                          'map': map,
                        }
                    );
                  },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  bookMarkButton: Container(),
                  restaurantCategory:
                      restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeWithTitle: false,
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
