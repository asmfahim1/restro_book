import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'filter_container_widget.dart';

class FilterSectionWidget extends StatefulWidget {
  const FilterSectionWidget({Key? key}) : super(key: key);

  @override
  State<FilterSectionWidget> createState() => _FilterSectionWidgetState();
}

class _FilterSectionWidgetState extends State<FilterSectionWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 16,
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

  Widget _allFilterWidget(){
    Size size = MediaQuery.of(context).size;
    return FilterContainerWidget(
      width: size.width / 7.5,
    );
  }

  Widget _cuisineFilterWidget(){
    Size size = MediaQuery.of(context).size;
    return FilterContainerWidget(
      width: size.width / 4,
      isTextNeeded: true,
      filterName: 'Cuisine',
    );
  }

  Widget _settingFilterWidget(){
    Size size = MediaQuery.of(context).size;
    return FilterContainerWidget(
      width: size.width / 4,
      isTextNeeded: true,
      filterName: 'Setting',
    );
  }

  Widget _priceFilterWidget(){
    Size size = MediaQuery.of(context).size;
    return FilterContainerWidget(
      width: size.width / 4.8,
      isTextNeeded: true,
      filterName: 'Price',
    );
  }

  Widget _neighborhoodFilterWidget(){
    Size size = MediaQuery.of(context).size;
    return FilterContainerWidget(
      width: size.width / 2.8,
      isTextNeeded: true,
      filterName: 'Neighborhoods',
    );
  }

  Widget _offersFilterWidget(){
    Size size = MediaQuery.of(context).size;
    return FilterContainerWidget(
      width: size.width / 4.6,
      isTextNeeded: true,
      filterName: 'Offers',
    );
  }

  Widget _specialFeaturesFilterWidget(){
    Size size = MediaQuery.of(context).size;
    return FilterContainerWidget(
      width: size.width / 2.6,
      isTextNeeded: true,
      filterName: 'Special Features',
    );
  }
}
