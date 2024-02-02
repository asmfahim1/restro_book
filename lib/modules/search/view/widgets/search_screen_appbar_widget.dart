import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';

import '../../../../core/utils/exports.dart';

class SearchScreenAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  SearchScreenAppBarWidget({
    super.key,
  });

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: InkWell(
          borderRadius: BorderRadius.circular(30),
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
            width: Dimensions.width100 * 1.85,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: strokeColor),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person_outline_rounded,
                  size: 14,
                  color: blackColor,
                ),
                Obx(
                  () => TextWidget(
                    ' ${homeController.noOfMember}',
                    style: TextStyles.regular12.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: blackColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(
                    color: blackColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Obx(() {
                    return TextWidget(
                      DateFormat('E, MMM d h:mm a')
                          .format(homeController.dateTime),
                      style: TextStyles.regular12.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: blackColor,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  ///Search modal sheet
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
                  homeController.dateTime = date;
                }),
          ),
          _doneButton()
        ],
      ),
    );
  }

  ///search bottom sheet button
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
}
