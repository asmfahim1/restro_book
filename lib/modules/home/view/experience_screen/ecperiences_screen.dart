import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/const.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';
import 'package:restro_book/modules/home/view/widget/experience_featured_widget.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';

class ExperiencesBarScreen extends StatefulWidget {
  const ExperiencesBarScreen({Key? key}) : super(key: key);

  @override
  State<ExperiencesBarScreen> createState() => _ExperiencesBarScreenState();
}

class _ExperiencesBarScreenState extends State<ExperiencesBarScreen> {
  final homeController = Get.find<HomeController>();

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
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                showModalBottomSheet<dynamic>(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: false,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return _showDateTimeBottomSheet();
                    });
              },
              child: Container(
                height: Dimensions.height30,
                width: Dimensions.width35 + Dimensions.width10,
                decoration: BoxDecoration(
                  border: Border.all(color: strokeColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_outline_rounded,
                      size: 14,
                    ),
                    Obx(
                      () => TextWidget(
                        ' ${homeController.noOfMember}',
                        style: TextStyles.regular12
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    /*const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                          color: blackColor, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Obx(() {
                      return TextWidget(
                        DateFormat('E, MMM d h:mm a')
                            .format(controller.dateTime),
                        style: TextStyles.regular12
                            .copyWith(fontWeight: FontWeight.bold),
                      );
                    }),*/
                  ],
                ),
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
                    style: TextStyles.regular12
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///reservation for  party size
  Widget _showDateTimeBottomSheet() {
    DateTime initialDateTime = DateTime.now();
    int initialMinute = initialDateTime.minute;
    if (initialDateTime.minute % 15 != 0) {
      initialMinute = initialDateTime.minute - initialDateTime.minute % 15 + 15;
    }
    return Container(
      height: Dimensions.heightScreenHalf * 1.26,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10),
            child: TextWidget(
              'Party Size',
              style: TextStyles.title16,
            ),
          ),
          const SizedBoxHeight10(),
          SizedBox(
            height: Dimensions.height50,
            child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                controller: homeController.scrollController,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Obx(() {
                      final isSelected =
                          homeController.selectedMemberIndex == index;
                      final containerColor =
                          isSelected ? primaryColor : strokeColor;
                      return GestureDetector(
                        onTap: () {
                          homeController.setSelectedMember(index);
                        },
                        child: Container(
                          height: Dimensions.height50,
                          width: Dimensions.width50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: containerColor,
                                width: isSelected ? 2 : 1,
                              ),
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: TextWidget(
                            '${index + 1}',
                            style: TextStyles.title16,
                          ),
                        ),
                      );
                    }),
                  );
                }),
          ),
          const SizedBoxHeight10(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextWidget(
              'Date and Time',
              style: TextStyles.title16,
            ),
          ),
          const SizedBoxHeight10(),
          SizedBox(
            height: Dimensions.height275 - Dimensions.height40,
            child: CupertinoDatePicker(
                initialDateTime: DateTime(
                    initialDateTime.year,
                    initialDateTime.month,
                    initialDateTime.day,
                    initialDateTime.hour,
                    initialMinute),
                minuteInterval: 15,
                mode: CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (date) {
                  final formattedDate =
                      DateFormat('E, MMM d h:mm a').format(date);
                  print('The picked date and Time is: $formattedDate');
                  homeController.dateTime = date;
                }),
          ),
          _doneButton(),
        ],
      ),
    );
  }

  ///reservation category
  Widget _doneButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CommonButton(
        height: Dimensions.height50,
        width: Dimensions.screenWidth,
        buttonTitle: 'Done',
        onPressed: () {
          Get.back();
        },
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
                                  color: Colors.black54,
                                  shape: BoxShape.circle),
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
                                style: TextStyles.regular14
                                    .copyWith(fontWeight: FontWeight.bold)
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
    return Padding(
      padding: allPadding15,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {},
        child: Container(
          height: Dimensions.height50,
          width: Dimensions.screenWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: strokeColor, width: 1.2)),
          child: TextWidget(
            'View all',
            style: TextStyles.title16,
          ),
        ),
      ),
    );
  }
}
