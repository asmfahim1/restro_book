import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/global_loader.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/available_for_brunch_widget.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/available_for_current_time.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/browse_by_cuisine_section.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/explore_area_section.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/featured_restaurants_widget.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/get_inspired_widget.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/happy_hour_widget.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/new-to_restrobook_widget.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/outdoor_dining_widget.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/components/recently_viewed_widget.dart';

class ReservationBarScreen extends StatelessWidget {
  const ReservationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    homeController.getMyLocation();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(() {
        return homeController.gettingLocation.value
            ? const GlobalLoader()
            : Column(
                children: [
                  _locationTimeWidget(context, homeController),
                  const SizedBoxHeight10(),
                  AvailableForCurrentTimeWidget(
                    homeController: homeController,
                  ),
                  const SizedBoxHeight10(),
                  OutDoorDiningWidget(
                    homeController: homeController,
                  ),
                  const SizedBoxHeight10(),
                  NewToRestroBookingWidget(
                    homeController: homeController,
                  ),
                  const SizedBoxHeight10(),
                  FeaturedRestaurantsWidget(
                    homeController: homeController,
                  ),
                  const SizedBoxHeight10(),
                  const RecentlyViewedRestaurantsWidget(),
                  const SizedBoxHeight10(),
                  HappyHourWidget(
                    homeController: homeController,
                  ),
                  const SizedBoxHeight10(),
                  AvailableForBrunchWidget(
                    homeController: homeController,
                  ),
                  const SizedBoxHeight10(),
                  const GetInspiredWidget(),
                  _browseByCuisineWidget(),
                  _exploreAreaWidget(),
                ],
              );
      }),
    );
  }

  Widget _locationTimeWidget(BuildContext context, HomeController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                showModalBottomSheet<dynamic>(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: false,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return _showDateTimeBottomSheet(controller);
                    });
              },
              child: Container(
                height: Dimensions.height30,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: strokeColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_outline_rounded,
                      size: 14,
                    ),
                    Obx(
                      () => TextWidget(
                        ' ${controller.noOfMember}',
                        style: TextStyles.regular12
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    /*const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                          color: blackColor, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Obx(() {
                      return TextWidget(
                        DateFormat('E, MMM d h:mm a')
                            .format(controller.dateTime),
                        style: TextStyles.regular12
                            .copyWith(fontWeight: FontWeight.bold),
                      );
                    }),*/
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Obx(() {
              return Container(
                height: Dimensions.height30,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: strokeColor),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: Dimensions.iconSize12,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextWidget(
                      overflow: TextOverflow.ellipsis,
                      controller.myLocation,
                      style: TextStyles.title32.copyWith(fontSize: 11),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  ///reservation for  party size
  Widget _showDateTimeBottomSheet(HomeController controller) {
    /*DateTime initialDateTime = DateTime.now();
    int initialMinute = initialDateTime.minute;
    if (initialDateTime.minute % 15 != 0) {
      initialMinute = initialDateTime.minute - initialDateTime.minute % 15 + 15;
    }*/
    return Container(
      height: Dimensions.height100 * 2.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 20,
            ),
            child: TextWidget(
              'Party Size',
              style: TextStyles.title16,
            ),
          ),
          const SizedBoxHeight10(),
          SizedBox(
            height: Dimensions.height50,
            child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                controller: controller.scrollController,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Obx(() {
                      final isSelected =
                          controller.selectedMemberIndex == index;
                      final containerColor =
                          isSelected ? primaryColor : strokeColor;
                      return GestureDetector(
                        onTap: () {
                          controller.setSelectedMember(index);
                        },
                        child: Container(
                          height: Dimensions.height50,
                          width: Dimensions.width50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: containerColor,
                                width: isSelected ? 2 : 1,
                              ),
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: TextWidget(
                            '${index + 1}',
                            style: TextStyles.title16,
                          ),
                        ),
                      );
                    }),
                  );
                }),
          ),
          SizedBox(
            height: Dimensions.height40,
          ),
          /*Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextWidget(
              'Date and Time',
              style: TextStyles.title16,
            ),
          ),
          const SizedBoxHeight10(),
          SizedBox(
            height: Dimensions.height275 - Dimensions.height40,
            child: CupertinoDatePicker(
                initialDateTime: DateTime(
                    initialDateTime.year,
                    initialDateTime.month,
                    initialDateTime.day,
                    initialDateTime.hour,
                    initialMinute),
                minuteInterval: 15,
                mode: CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (date) {
                  final formattedDate =
                      DateFormat('E, MMM d h:mm a').format(date);
                  controller.dateTime = date;
                }),
          ),*/
          _doneButton(),
        ],
      ),
    );
  }

  ///reservation category
  Widget _doneButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CommonButton(
        height: Dimensions.height50,
        width: Dimensions.screenWidth,
        buttonTitle: 'Done',
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  Widget _browseByCuisineWidget() {
    return BrowseByCuisineSectionWidget(
      title: 'Browse by cuisine',
      viewAllOnTap: () {
        Get.toNamed(AppRoutes.viewAllCuisines);
      },
    );
  }

  Widget _exploreAreaWidget() {
    return ExploreAresSectionWidget(
      title: 'Explore the area',
      viewAllOnTap: () {
        Get.toNamed(AppRoutes.viewAllArea);
      },
    );
  }
}
