import 'package:flutter/material.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../core/utils/exports.dart';

class ExploreAresSectionWidget extends StatelessWidget {
  final double height;
  final String title;
  final VoidCallback viewAllOnTap;
  const ExploreAresSectionWidget(
      {required this.height,
      required this.title,
      required this.viewAllOnTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
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
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListView.builder(
                  itemCount: exploreAres.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                   final explore = exploreAres[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: strokeColor)),
                        alignment: Alignment.center,
                        child: TextWidget(
                          explore,
                          style: TextStyles.title11,
                        ),
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
