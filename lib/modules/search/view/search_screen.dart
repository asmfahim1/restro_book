import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/search/view/widgets/filter_section_widget.dart';
import 'package:restro_book/modules/search/view/widgets/search_list_section.dart';
import 'package:restro_book/modules/search/view/widgets/search_screen_appbar_widget.dart';


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
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchContainerWidget(),
        const FilterSectionWidget(),
        _nearbyRestaurantsWidget(),
        const Expanded(
          child: SearchListSectionWidget(),
        )
      ],
    );
  }

  Widget _searchContainerWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: size.height / 15,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(offset: Offset(0, 0), blurRadius: 5, color: strokeColor)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search_sharp,
            size: 20,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintText: "Search Dhanmondi",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 15),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(
              searchLocationImagePath,
              height: size.height / 26,
              width: size.width / 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _nearbyRestaurantsWidget(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 16,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      child: TextWidget(
        '176 Restaurants nearby',
        style: TextStyles.title16.copyWith(fontSize: 13),
      ),
    );
  }

}
