import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
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
    print('Search screen build');
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
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 100,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: (){
              Get.toNamed(AppRoutes.searchDetailsScreen);
            },
            child: Container(
              height: size.height / 3.3,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: strokeColor)
                  )
              ),
              child: Row(
                children: [
                  _listViewLeftSection(),
                  _listViewRightSection(),
                ],
              ),
            ),
          );
        });
  }

  Widget _listViewLeftSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget('STK - San Francisco',
            style: TextStyles.title16),
        Row(
          children: [
            const Icon(Icons.star, size: 16, color: primaryColor,),
            TextWidget(' 754 reviews', style: TextStyles.regular14),
          ],
        ),
        TextWidget(
            '0.3 mi ∙ Financial District / Embassidor...',
            style: TextStyles.regular12),
        TextWidget('\$\$\$\$ ∙ Steakehouse',
            style: TextStyles.regular12),
        const SizedBoxHeight10(),
        TextWidget('Seating: standard, outdoor',
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

  Widget _listViewRightSection(){
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: size.height / 30,
          width: size.width / 6,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: strokeColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextWidget('Promoted', style: TextStyles.regular12,),
        ),
        const SizedBox(height: 5,),
        Container(
          height: size.height / 6.5,
          width: size.width / 3.8,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: strokeColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(defaultFoodImagePath, height: 70,width: 70,),
        )
      ],
    );
  }


  Widget _timeContainerWidget(){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 20,
          width: size.width / 5.5,
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
          height: size.height / 28,
          width: size.width / 5.5,
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
