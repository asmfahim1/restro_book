import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../../core/utils/exports.dart';

class ExploreAresSectionWidget extends StatelessWidget {
  final String title;
  final VoidCallback viewAllOnTap;
  const ExploreAresSectionWidget(
      {
      required this.title,
      required this.viewAllOnTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height60,
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
                    style: TextStyles.title16.copyWith(color: primaryColor),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListView.builder(
                  itemCount: exploreAres.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                   final explore = exploreAres[index];
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: strokeColor)),
                      alignment: Alignment.center,
                      child: TextWidget(
                        explore,
                        style: TextStyles.title11,
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
