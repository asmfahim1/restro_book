import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/const.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/view/widget/experience_featured_widget.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/text_widget.dart';

class ExperiencesBarScreen extends StatefulWidget {
  const ExperiencesBarScreen({Key? key}) : super(key: key);

  @override
  State<ExperiencesBarScreen> createState() => _ExperiencesBarScreenState();
}

class _ExperiencesBarScreenState extends State<ExperiencesBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _locationTimeWidget(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _featuredWidget(),
                _upcomingTitle(),
                const SizedBoxHeight10(),
                _upcomingListWidget(),
                _viewAllBtn(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _locationTimeWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: Dimensions.height30,
              width: Dimensions.width35 + Dimensions.width10,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline_rounded,
                    size: Dimensions.iconSize15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextWidget(
                    '2',
                    style: TextStyles.regular12.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              height: Dimensions.height30,
              width: Dimensions.width135 - 5,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: Dimensions.iconSize15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextWidget(
                    overflow: TextOverflow.ellipsis,
                    'Noe Valley',
                    style: TextStyles.regular12.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredWidget() {
    return ExperienceFeaturedWidget(
      titleOfTheList: 'Featured',
      onTap: () {},
    );
  }

  Widget _upcomingTitle() {
    return Container(
      height: Dimensions.height40,
      width: Dimensions.screenWidth,
      padding: leftRightPadding15,
      alignment: Alignment.centerLeft,
      child: TextWidget(
        'Upcoming',
        style: TextStyles.title20,
      ),
    );
  }

  Widget _upcomingListWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (_, index) {
          return Container(
            height: Dimensions.height100 + Dimensions.height20,
            margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: strokeColor))),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: Dimensions.width225,
                    child: Column(
                      children: [
                        TextWidget(
                          'Petite Omakase for Tuesday through Thursday',
                          style: TextStyles.title16,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              'KUSAKABE',
                              style: TextStyles.regular12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                  color: Colors.black54, shape: BoxShape.circle),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextWidget(
                              '\$ 148.00',
                              style: TextStyles.regular12,
                            ),
                          ],
                        ),
                        TextWidget(
                          'Financial District / Embarcadero, San Fransisco',
                          style: TextStyles.regular12,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: Dimensions.height50,
                        width: Dimensions.width35 * 2 + Dimensions.width10,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 1.0,
                              offset: const Offset(0, 0),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: Dimensions.height20,
                              color: primaryColor,
                              alignment: Alignment.center,
                              child: TextWidget(
                                'Oct',
                                style: TextStyles.regular14.copyWith(fontWeight: FontWeight.bold)
                                    .copyWith(color: whiteColor),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: whiteColor,
                                alignment: Alignment.center,
                                child: TextWidget(
                                  '22',
                                  style: TextStyles.title20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _viewAllBtn() {
    return Container(
      height: Dimensions.height50,
      width: Dimensions.screenWidth,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: strokeColor, width: 1.2)),
      child: TextWidget(
        'View all',
        style: TextStyles.title16,
      ),
    );
  }
}
