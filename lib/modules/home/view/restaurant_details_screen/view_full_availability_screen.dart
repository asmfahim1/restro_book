import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class ViewFullAvailabilityScreen extends StatelessWidget {
  final String resId;
  final String resName;
  ViewFullAvailabilityScreen(
      {Key? key, required this.resId, required this.resName})
      : super(key: key);

  final reservationController = Get.find<ReservationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppbar(),
      body: _buildBody(),
      bottomNavigationBar: _timeContainer(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      child: Column(
        children: [
          _partySizeWidget(),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: _customDateWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _partySizeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10),
          child: TextWidget(
            'Party Size',
            style: TextStyles.title20,
          ),
        ),
        const SizedBoxHeight10(),
        SizedBox(
          height: Dimensions.height50,
          child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              controller: reservationController.scrollController,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Obx(() {
                    final isSelected =
                        reservationController.selectedMemberIndex == index;
                    final containerColor =
                        isSelected ? primaryColor : strokeColor;
                    return GestureDetector(
                      onTap: () {
                        reservationController.setSelectedMember(index);
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
      ],
    );
  }

  Widget _customDateWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: TextWidget(
            'Date',
            style: TextStyles.title20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Obx(() {
          return TableCalendar(
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyles.title16,
              weekendStyle: TextStyles.title16,
            ),
            calendarStyle: CalendarStyle(
              weekendTextStyle: TextStyles.title16,
              defaultTextStyle: TextStyles.title16,
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(
                    0.7), // Change this color to your desired active circle color
              ),
              selectedDecoration: const BoxDecoration(
                shape: BoxShape.circle,
                color:
                    primaryColor, // Change this color to your desired active circle color
              ),
            ),
            headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextFormatter: (date, locale) =>
                    DateFormat.yMMM(locale).format(date),
                formatButtonVisible: false,
                titleTextStyle: TextStyles.title20,
                leftChevronIcon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                  color: Colors.black,
                ),
                rightChevronIcon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Colors.black,
                )),
            rowHeight: Dimensions.height45,
            daysOfWeekHeight: Dimensions.height40,
            focusedDay: reservationController.dateTime,
            firstDay: DateTime(2023),
            lastDay: DateTime(2025),
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(selectedDay, reservationController.dateTime)) {
                reservationController.dateTime = selectedDay;
                print(
                    "Selected Date: ${DateFormat.MMMMd().format(selectedDay)}");
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(reservationController.dateTime, day);
            },
            enabledDayPredicate: (day) => !day.isBefore(DateTime.now()),
          );
        }),
      ],
    );
  }

  Widget _timeContainer() {
    return Container(
      height: Dimensions.height80,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 4.0,
            spreadRadius: 2.0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: TextWidget(
                DateFormat.MMMMd().format(reservationController.dateTime),
                style: TextStyles.title16,
              ),
            );
          }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final time = TimeOfDay(
                      hour: 11 + index ~/ 2, minute: (index % 2) * 30);
                  DateTime now = DateTime.now();
                  DateTime dateTime = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    time.hour,
                    time.minute,
                  );
                  return GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.toNamed(
                        AppRoutes.getBookingConfirmScreen(
                          resId,
                          resName,
                          reservationController.noOfMember.toString(),
                          dateTime,
                        ),
                      );
                    },
                    child: Container(
                        width: Dimensions.width50 * 1.8,
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(
                                5)), // Adjust the width as needed
                        alignment: Alignment.center,
                        child: TextWidget(
                          time.format(context),
                          style: TextStyles.title16
                              .copyWith(fontSize: 13, color: whiteColor),
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
