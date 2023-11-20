import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/text_widget.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/components/sliver_header_data.dart';

class ResNameWithDesc extends StatelessWidget {
  const ResNameWithDesc({
    Key? key,
    required this.map,
  }) : super(key: key);

  final Map<String, String> map;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            map['resName'] ?? '',
            style: TextStyles.title20,
            overflow: TextOverflow.ellipsis,
          ),
          SliverHeaderData(map: map,),
        ],
      ),
    );
  }
}
