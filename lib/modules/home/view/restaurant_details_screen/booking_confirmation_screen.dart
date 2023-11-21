import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/styles.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/components/epanded_text_field_widget.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/components/occasion_widget.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/components/phone_number_with_country_code_widget.dart';

class BookingConfirmScreen extends StatelessWidget {

  final Map<String, String> map;
  final String partySize;
  final String? date;
  final String? time;
  BookingConfirmScreen(
      {Key? key,
      required this.map,
      required this.partySize,
      this.date,
      this.time,
      })
      : super(key: key);

  final reservationController = Get.find<ReservationController>();

  @override
  Widget build(BuildContext context) {
    /*String dateString = DateFormat('E, MMM d').format(reservationTime);
    String timeString = DateFormat('h : mm a').format(reservationTime);*/
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppbar(),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: Dimensions.heightScreenHalf * 1.6,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    map['resName'] ?? '',
                    style: TextStyles.title22,
                  ),
                  const SizedBoxHeight10(),
                  _partyDescriptionWidget(date!, time!),
                  const SizedBoxHeight20(),
                  _specialRequestWidget(reservationController),
                  const SizedBoxHeight20(),
                  _occasionWidget(),
                  const SizedBoxHeight20(),
                  _phoneWithCountryCodeWidget(),
                  const SizedBoxHeight20(),
                  _reservationUpdateWidget(reservationController),
                  const SizedBoxHeight20(),
                  const SizedBoxHeight20(),
                  _mailingAddressWidget(reservationController),
                  const SizedBoxHeight20(),
                  const SizedBoxHeight20(),
                  _privacyPolicyWidget(),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: _reserveButton(context),
          ),
        ],
      ),
    );
  }

  Widget _partyDescriptionWidget(String dateString, String timeString) {
    return Column(
      children: [
        _reservationDetailsWidget(Icons.person_outline_outlined, partySize),
        _reservationDetailsWidget(Icons.calendar_today_outlined, dateString),
        _reservationDetailsWidget(Icons.watch_later_outlined, timeString),
      ],
    );
  }

  Widget _reservationDetailsWidget(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          TextWidget(
            title,
            style: TextStyles.regular12,
          ),
        ],
      ),
    );
  }

  Widget _specialRequestWidget(ReservationController controller) {
    return ExpandedTextFieldWithTitle(
      title: 'Any special request?',
      hintText: 'Add special request here...',
      controller: controller.specialRequestController,
    );
  }

  Widget _occasionWidget() {
    return const OccasionWidget(title: 'What\'s the occasion?');
  }

  Widget _phoneWithCountryCodeWidget() {
    return const TitleWithPhoneNumberAndCountryCodeWidget(
        title: 'What\'s your number?');
  }

  Widget _reservationUpdateWidget(ReservationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              'Reservation text updates',
              style: TextStyles.title16,
            ),
            Obx(() {
              return Switch(
                activeColor: primaryColor,
                inactiveTrackColor: strokeColor,
                value: controller.switchActive1,
                onChanged: (bool value) {
                  controller.switchActive1 = !controller.switchActive1;
                },
              );
            }),
          ],
        ),
        const SizedBoxHeight10(),
        TextWidget(
          'Get reservation reminders and wait list status updates.',
          style: TextStyles.regular12,
        ),
        TextWidget(
          'Learn more',
          style: TextStyles.regular12
              .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _mailingAddressWidget(ReservationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              'Receive restaurant emails',
              style: TextStyles.title16,
            ),
            Obx(() {
              return Switch(
                activeColor: primaryColor,
                inactiveTrackColor: strokeColor,
                value: controller.switchActive2,
                onChanged: (bool value) {
                  controller.switchActive2 = !controller.switchActive2;
                },
              );
            }),
          ],
        ),
        const SizedBoxHeight10(),
        TextWidget(
          'Sign me up to receive dining offers and news from this restaurant by email.',
          style: TextStyles.regular12,
        ),
        TextWidget(
          'Learn more',
          style: TextStyles.regular12
              .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _privacyPolicyWidget() {
    return Wrap(
      children: [
        TextWidget(
          'By reserving you agree to the RestroBooking ',
          style: TextStyles.regular12.copyWith(color: strokeColor),
        ),
        TextWidget(
          'Privacy Policy',
          style: TextStyles.regular12.copyWith(color: primaryColor),
        ),
        TextWidget(
          'and ',
          style: TextStyles.regular12.copyWith(color: strokeColor),
        ),
        TextWidget(
          'Terms of Use.',
          style: TextStyles.regular12.copyWith(color: primaryColor),
        ),
      ],
    );
  }

  Widget _reserveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CommonButton(
        height: Dimensions.height50,
        width: Dimensions.screenWidth,
        buttonTitle: 'Reserve',
        buttonTextColor: whiteColor,
        buttonColor: primaryColor,
        onPressed: () {
          //route to another page
          reservationController.reserveTable(context);
        },
      ),
    );
  }
}
