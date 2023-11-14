import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../../core/utils/exports.dart';

class BrowseByCuisineSectionWidget extends StatelessWidget {
  final String title;
  final VoidCallback viewAllOnTap;
  final String imagePath;
  const BrowseByCuisineSectionWidget({
    required this.title,
    required this.viewAllOnTap,
    this.imagePath = featuredImagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height100 + Dimensions.height35,
      width: Dimensions.screenWidth,
      margin: const EdgeInsets.symmetric(vertical: 10),
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
                    style: TextStyles.title16
                        .copyWith(color: primaryColor, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  itemCount: restaurantCousins.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final cuisines = restaurantCousins[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: Dimensions.radius20 +
                                  Dimensions.radius12 +
                                  Dimensions.radius4,
                              backgroundImage: AssetImage(
                                imagePath,
                              ),
                            ),
                          ),
                          TextWidget(
                            cuisines,
                            style: TextStyles.regular12
                                .copyWith(fontWeight: FontWeight.bold),
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
