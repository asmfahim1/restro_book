import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:get/get.dart';
import 'package:restro_book/modules/home/view/widget/browse_by_cuisine_section.dart';
import 'package:restro_book/modules/home/view/widget/explore_area_section.dart';
import 'package:restro_book/modules/home/view/widget/title_with_listView_widget.dart';
import 'package:restro_book/modules/search/view/res_details_screen.dart';
class ReservationBarScreen extends StatefulWidget {
  const ReservationBarScreen({Key? key}) : super(key: key);

  @override
  State<ReservationBarScreen> createState() => _ReservationBarScreenState();
}

class _ReservationBarScreenState extends State<ReservationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _locationTimeWidget(),
          _availableLunchWidget(),
          _outdoorDiningWidget(),
          _newToRestroBookingWidget(),
          _featuredRestaurantsWidget(),
          _recentlyViewedWidget(),
          _happyOursWidget(),
          _availableForBrunchWidget(),
          _getInspiredWidget(),
          _browseByCuisineWidget(),
          _exploreAreaWidget(),
        ],
      ),
    );
  }

  Widget _locationTimeWidget() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: size.height / 22,
              width: size.width / 2.5,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.person_outline_rounded,
                    size: 12,
                  ),
                  TextWidget(
                    '2 . today at 12:00 PM',
                    style: TextStyles.title32.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: size.height / 22,
              width: size.width / 2.2,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 12,
                  ),
                  TextWidget(
                    overflow: TextOverflow.ellipsis,
                    'Matuail Katherpool Dhaka',
                    style: TextStyles.title32.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _commonTitleWidget(
      {
        required VoidCallback onTap,
        required String titleOfTheList,
        bool isViewNeeded = true,
}){
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: leftRightPadding15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              titleOfTheList,
              style: TextStyles.title16,
            ),
            isViewNeeded
                ? TextWidget(
                    'VIEW ALL',
                    style:
                    TextStyles.title16.copyWith(color: primaryColor),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _availableLunchWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.25,
      width: size.width,
      child: Column(
        children: [
          _commonTitleWidget(titleOfTheList: 'Available for lunch', onTap: () {}),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[restaurantList.length - 1 - index];
                return TitleWithListViewWidget(
                  onTap: (){
                    Get.to(()=> const RestaurantDetailsScreen());
                  },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory: restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: size.height / 28,
                  timeContainerWidth: size.width / 5,
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

  Widget _outdoorDiningWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.25,
      width: size.width,
      child: Column(
        children: [
          _commonTitleWidget(titleOfTheList: 'Outdoor Dining', onTap: () {}),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];
                return TitleWithListViewWidget(onTap: (){
                  Get.to(()=> const RestaurantDetailsScreen());
                },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory: restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: size.height / 28,
                  timeContainerWidth: size.width / 5,
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

  Widget _newToRestroBookingWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.25,
      width: size.width,
      child: Column(
        children: [
          _commonTitleWidget(titleOfTheList: 'New To Restrobooking', onTap: () {}),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[restaurantList.length - 1 - index];
                return TitleWithListViewWidget(onTap: (){
                  Get.to(()=> const RestaurantDetailsScreen());
                },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory: restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: size.height / 28,
                  timeContainerWidth: size.width / 5,
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

  Widget _featuredRestaurantsWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.25,
      width: size.width,
      child: Column(
        children: [
          _commonTitleWidget(titleOfTheList: 'Featured Restaurant', onTap: () {}),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];
                return TitleWithListViewWidget(onTap: (){
                  Get.to(()=> const RestaurantDetailsScreen());
                },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory: restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: size.height / 28,
                  timeContainerWidth: size.width / 5,
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

  Widget _recentlyViewedWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.25,
      width: size.width,
      child: Column(
        children: [
          _commonTitleWidget(titleOfTheList: 'Recently Viewed', onTap: () {}, isViewNeeded: false),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[restaurantList.length - 1 - index];
                return TitleWithListViewWidget(onTap: (){
                  Get.to(()=> const RestaurantDetailsScreen());
                },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory: restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: size.height / 28,
                  timeContainerWidth: size.width / 5,
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

  Widget _happyOursWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.25,
      width: size.width,
      child: Column(
        children: [
          _commonTitleWidget(titleOfTheList: 'Happy Hours', onTap: () {}),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];
                return TitleWithListViewWidget(onTap: (){
                  Get.to(()=> const RestaurantDetailsScreen());
                },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory: restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: size.height / 28,
                  timeContainerWidth: size.width / 5,
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

  Widget _availableForBrunchWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.25,
      width: size.width,
      child: Column(
        children: [
          _commonTitleWidget(titleOfTheList: 'Available for brunch', onTap: () {}),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[restaurantList.length - 1 - index];
                return TitleWithListViewWidget(onTap: (){
                  Get.to(()=> const RestaurantDetailsScreen());
                },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory: restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: size.height / 28,
                  timeContainerWidth: size.width / 5,
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

  Widget _getInspiredWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.25,
      width: size.width,
      child: Column(
        children: [
          _commonTitleWidget(titleOfTheList: 'Get inspired', onTap: () {}, isViewNeeded: false),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[restaurantList.length - 1 - index];
                return TitleWithListViewWidget(onTap: (){
                  Get.to(()=> const RestaurantDetailsScreen());
                },
                  imageUrl: restaurant['restaurantImage'].toString(),
                  restaurantName: restaurant['restaurantName'].toString(),
                  restaurantCategory: restaurant['restaurantCategory'].toString(),
                  restaurantRate: restaurant['restaurantRate'].toString(),
                  timeContainerHeight: size.height / 28,
                  timeContainerWidth: size.width / 5,
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

  Widget _browseByCuisineWidget() {
    return BrowseByCuisineSectionWidget(
      title: 'Browse by cuisine',
      viewAllOnTap: () {},
      itemLength: 10,
      categoryName: 'American',
    );
  }

  Widget _exploreAreaWidget() {
    Size size = MediaQuery.of(context).size;
    return ExploreAresSectionWidget(
      height: size.height / 10,
      title: 'Explore the area',
      viewAllOnTap: () {},
    );
  }
}
