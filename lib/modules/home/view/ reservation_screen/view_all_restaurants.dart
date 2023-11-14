import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/core/widgets/text_widget.dart';

import '../../../../core/utils/exports.dart';

class ViewAllRestaurantsScreen extends StatelessWidget {
  const ViewAllRestaurantsScreen({super.key});

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
        title: _appBar(),
        elevation: 1,
      ),
      body: _buildBody(),
    );
  }

  Widget _appBar() {
    return Container(
      height: Dimensions.height30,
      width: Dimensions.width135 + Dimensions.width15,
      decoration: BoxDecoration(
        border: Border.all(color: strokeColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline_rounded,
            size: Dimensions.iconSize15,
            color: blackColor,
          ),
          const SizedBox(
            width: 5,
          ),
          TextWidget(
            '2 . today at 12:00 PM',
            style: TextStyles.regular12
                .copyWith(fontWeight: FontWeight.bold, color: blackColor),
          ),
        ],
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

  Widget _listViewLeftSection(String title, String review, String category,
      String location, String seatingStyle, String priceUnit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(title, style: TextStyles.title16),
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
          width: Dimensions.screenWidth,
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
