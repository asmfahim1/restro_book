import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextWidget(
          'Saved restaurants',
          style: TextStyles.title20.copyWith(),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      padding: leftRightPadding15,
      child: ListView.builder(
          itemCount: homeController.savedList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            final restaurants = homeController.savedList[index];
            return InkWell(
              onTap: () {},
              child: Container(
                height: Dimensions.height100 + Dimensions.height50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: strokeColor))),
                child: Row(
                  children: [
                    _listViewLeftSection(
                      restaurants.restaurantName.toString(),
                      restaurants.restaurantRate.toString(),
                      restaurants.restaurantMap.toString(),
                      restaurants.restaurantCategory.toString(),
                      restaurants.restaurantDiningStyle.toString(),
                      restaurants.restaurantPriceUnit.toString(),
                    ),
                    Expanded(
                      child: _listViewRightSection(
                        restaurants.restaurantImage.toString(),
                      ),
                    ),
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
          width: Dimensions.width135,
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
}
