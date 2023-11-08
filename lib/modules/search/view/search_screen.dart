import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/search/view/widgets/filter_section_widget.dart';
import 'package:restro_book/modules/search/view/widgets/nearby_restaurant_container_widget.dart';
import 'package:restro_book/modules/search/view/widgets/search_field_widget.dart';
import 'package:restro_book/modules/search/view/widgets/search_screen_appbar_widget.dart';
import '../../../core/widgets/sized_box_height_10.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const SearchScreenAppBarWidget(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchFieldWidget(),
        const FilterSectionWidget(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const NearbyRestaurantContainerWidget(),
                _searchListSectionWidget()
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _searchListSectionWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: restaurantList.length,
        itemBuilder: (_, index) {
          final restaurants = restaurantList[index];
          return InkWell(
            onTap: (){
              Get.toNamed(AppRoutes.getResDetailsScreen(restaurants['restaurantName']!.toString(), restaurants['restaurantID']!.toString()));
            },
            child: Container(
              height: Dimensions.height100 + Dimensions.height80,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: strokeColor)
                  )
              ),
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
                  Expanded(child: _listViewRightSection(restaurants['restaurantImage'].toString())),
                ],
              ),
            ),
          );
        });
  }

  Widget _listViewLeftSection(String title, String review, String category, String location, String seatingStyle, String priceUnit){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
            title,
            style: TextStyles.title16),
        Row(
          children: [
            Icon(Icons.star, size: Dimensions.iconSize15, color: primaryColor,),
            TextWidget('$review reviews', style: TextStyles.regular14),
          ],
        ),
        TextWidget(
            '0.3 mi ∙ $location',
            style: TextStyles.regular12),
        TextWidget('$priceUnit ∙ $category',
            style: TextStyles.regular12),
        const SizedBoxHeight10(),
        TextWidget('Seating: $seatingStyle',
            style: TextStyles.regular12),
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

  Widget _listViewRightSection(String imageUrl){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: Dimensions.height20,
          width: Dimensions.width50 + Dimensions.width10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextWidget('Promoted', style: TextStyles.regular12.copyWith(fontSize: 11),),
        ),
        const SizedBox(height: 5,),
        Container(
          height: Dimensions.height100 - Dimensions.height20,
          width: Dimensions.screenWidth,
          decoration: BoxDecoration(
            color: strokeColor,
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(imageUrl.isEmpty ? searchedFeatureImagePath : imageUrl, fit: BoxFit.cover,),
        )
      ],
    );
  }


  Widget _timeContainerWidget(){
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
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5)
            ),
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
                bottomRight: Radius.circular(5)
            ),
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
