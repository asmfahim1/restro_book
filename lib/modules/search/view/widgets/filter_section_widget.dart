import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';

import 'filter_container_widget.dart';

class FilterSectionWidget extends StatefulWidget {
  const FilterSectionWidget({Key? key}) : super(key: key);

  @override
  State<FilterSectionWidget> createState() => _FilterSectionWidgetState();
}

class _FilterSectionWidgetState extends State<FilterSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height35,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _allFilterWidget(),
              _cuisineFilterWidget(),
              _settingFilterWidget(),
              _priceFilterWidget(),
              _neighborhoodFilterWidget(),
              _offersFilterWidget(),
              _specialFeaturesFilterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _allFilterWidget() {
    return FilterContainerWidget(
      width: Dimensions.width50,
    );
  }

  Widget _cuisineFilterWidget() {
    return FilterContainerWidget(
      width: Dimensions.width35 * 2 + Dimensions.width15,
      isTextNeeded: true,
      filterName: 'Cuisine',
    );
  }

  Widget _settingFilterWidget() {
    return FilterContainerWidget(
      width: Dimensions.width35 * 2 + Dimensions.width15,
      isTextNeeded: true,
      filterName: 'Setting',
    );
  }

  Widget _priceFilterWidget() {
    return FilterContainerWidget(
      width: Dimensions.width35 * 2,
      isTextNeeded: true,
      filterName: 'Price',
    );
  }

  Widget _neighborhoodFilterWidget() {
    return FilterContainerWidget(
      width: Dimensions.width135,
      isTextNeeded: true,
      filterName: 'Neighborhoods',
    );
  }

  Widget _offersFilterWidget() {
    return FilterContainerWidget(
      width: Dimensions.width35 * 2 + Dimensions.width10,
      isTextNeeded: true,
      filterName: 'Offers',
    );
  }

  Widget _specialFeaturesFilterWidget() {
    return FilterContainerWidget(
      width: Dimensions.width135 + Dimensions.width10,
      isTextNeeded: true,
      filterName: 'Special Features',
    );
  }
}
