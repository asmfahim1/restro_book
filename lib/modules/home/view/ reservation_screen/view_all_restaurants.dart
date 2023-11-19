import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';

import '../../../../core/utils/exports.dart';

class ViewAllRestaurantsScreen extends StatelessWidget {
  ViewAllRestaurantsScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: primaryColor,
            )),
        title: _appBar(context),
        elevation: 1,
      ),
      body: _buildBody(),
    );
  }

  Widget _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          showModalBottomSheet<dynamic>(
              context: context,
              isScrollControlled: true,
              enableDrag: false,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return _showDateTimeBottomSheet();
              });
        },
        child: Container(
          height: Dimensions.height30,
          width: Dimensions.width180 - Dimensions.width10,
          decoration: BoxDecoration(
            border: Border.all(color: strokeColor),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_outline_rounded,
                size: 14,
                color: blackColor,
              ),
              Obx(
                () => TextWidget(
                  ' ${homeController.noOfMember}',
                  style: TextStyles.regular12.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: blackColor),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  color: blackColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Obx(() {
                return TextWidget(
                  DateFormat('E, MMM d h:mm a').format(homeController.dateTime),
                  style: TextStyles.regular12.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: blackColor),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      padding: leftRightPadding15,
      child: ListView.builder(
          itemCount: seeAllRestaurants.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            final restaurants = seeAllRestaurants[index];
            return InkWell(
              onTap: () {},
              child: Container(
                height: Dimensions.height100 + Dimensions.height80,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: strokeColor))),
                child: Row(
                  children: [
                    _listViewLeftSection(
                      restaurants['restaurantName'].toString(),
                      restaurants['restaurantRate'].toString(),
                      restaurants['restaurantMap'].toString(),
                      restaurants['restaurantCategory'].toString(),
                      restaurants['restaurantDiningStyle'].toString(),
                      restaurants['restaurantPriceUnit'].toString(),
                    ),
                    Expanded(
                        child: _listViewRightSection(
                            restaurants['restaurantImage'].toString())),
                  ],
                ),
              ),
            );
          }),
    );
  }

  ///reservation for  party size
  Widget _showDateTimeBottomSheet() {
    DateTime initialDateTime = DateTime.now();
    int initialMinute = initialDateTime.minute;
    if (initialDateTime.minute % 15 != 0) {
      initialMinute = initialDateTime.minute - initialDateTime.minute % 15 + 15;
    }
    return Container(
      height: Dimensions.heightScreenHalf * 1.26,
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
            padding: const EdgeInsets.only(left: 15.0, top: 10),
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
                controller: homeController.scrollController,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Obx(() {
                      final isSelected =
                          homeController.selectedMemberIndex == index;
                      final containerColor =
                          isSelected ? primaryColor : strokeColor;
                      return GestureDetector(
                        onTap: () {
                          homeController.setSelectedMember(index);
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
          const SizedBoxHeight10(),
          Padding(
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
                  homeController.dateTime = date;
                }),
          ),
          _doneButton(),
        ],
      ),
    );
  }

  ///reservation done button
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

  Widget _listViewLeftSection(String title, String review, String category,
      String location, String seatingStyle, String priceUnit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(title, style: TextStyles.title20),
        Row(
          children: [
            Icon(
              Icons.star,
              size: Dimensions.iconSize15,
              color: primaryColor,
            ),
            TextWidget('$review reviews', style: TextStyles.regular14),
          ],
        ),
        TextWidget('0.3 mi ∙ $location', style: TextStyles.regular12),
        TextWidget('$priceUnit ∙ $category', style: TextStyles.regular12),
        const SizedBoxHeight10(),
        TextWidget('Seating: $seatingStyle', style: TextStyles.regular12),
        const SizedBoxHeight10(),
        Row(
          children: [
            _timeContainerWidget(),
            _timeContainerWidget(),
            _timeContainerWidget(),
          ],
        ),
      ],
    );
  }

  Widget _listViewRightSection(String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*Container(
          height: Dimensions.height20,
          width: Dimensions.width50 + Dimensions.width10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextWidget(
            'Promoted',
            style: TextStyles.regular12.copyWith(fontSize: 11),
          ),
        ),*/
        const SizedBox(
          height: 5,
        ),
        Container(
          height: Dimensions.height100,
          width: Dimensions.width100 * 1.2,
          decoration: BoxDecoration(
            color: strokeColor,
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            imageUrl.isEmpty ? searchedFeatureImagePath : imageUrl,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  Widget _timeContainerWidget() {
    return Column(
      children: [
        Container(
          height: Dimensions.height20,
          width: Dimensions.width50 + Dimensions.width15,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 10),
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
          child: TextWidget(
            '11:45 AM',
            style: TextStyles.title32.copyWith(fontSize: 12, color: whiteColor),
          ),
        ),
        Container(
          height: Dimensions.height20,
          width: Dimensions.width50 + Dimensions.width15,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            border: Border.all(color: primaryColor),
          ),
          child: TextWidget(
            '+ 500 pts',
            style: TextStyles.title11.copyWith(color: primaryColor),
          ),
        )
      ],
    );
  }
}
