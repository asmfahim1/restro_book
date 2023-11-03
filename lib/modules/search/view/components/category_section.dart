import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/modules/search/controller/search_controller.dart';
import 'package:restro_book/modules/search/view/widgets/sliver_body_item.dart';

class CategorySection extends StatelessWidget {
  final int index;
  final SearchFieldController controller;

  const CategorySection({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 10.0),
      //margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTileHeader(context,controller),
          SliverBodyItems(categoryIndex: controller.listCategory[index].category),
        ],
      ),
    );
  }

  Widget _buildSectionTileHeader(BuildContext context,SearchFieldController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _sectionTitle(context, controller),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context, SearchFieldController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Text(
            controller.listCategory[index].category,
            style: TextStyles.title16,
            //strutStyle: Helper.buildStrutStyle(_textTheme(context).headline6),
          )
        ],
      ),
    );
  }
}
