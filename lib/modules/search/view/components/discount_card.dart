import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/widgets/text_widget.dart';

import '../../../../core/utils/styles.dart';
import '../widgets/sliver_header_data.dart';

class ResNameWithDesc extends StatelessWidget {
  const ResNameWithDesc({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      /*margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),*/
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            title,
            style: TextStyles.title20,
            overflow: TextOverflow.ellipsis,
          ),
          const SliverHeaderData(),
        ],
      ),
    );
  }
}
