import 'package:flutter/material.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../core/utils/exports.dart';

class BrowseByCuisineSectionWidget extends StatelessWidget {
  final String title;
  final VoidCallback viewAllOnTap;
  final int itemLength;
  final String imagePath;
  final String categoryName;
  const BrowseByCuisineSectionWidget({
    required this.title,
    required this.viewAllOnTap,
    required this.itemLength,
    this.imagePath = restroBookImagePath,
    required this.categoryName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 4.4,
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: viewAllOnTap,
            child: Padding(
              padding: leftRightPadding15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title,
                    style: TextStyles.title16,
                  ),
                  TextWidget(
                    'VIEW ALL',
                    style: TextStyles.title16.copyWith(color: primaryColor),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: ListView.builder(
                  itemCount: itemLength,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            child: Image.asset(imagePath),
                          ),
                          TextWidget(
                            categoryName,
                            style: TextStyles.title32.copyWith(fontSize: 13),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
