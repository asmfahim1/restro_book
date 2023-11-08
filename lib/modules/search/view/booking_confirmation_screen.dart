import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/styles.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/search/controller/search_controller.dart';
import 'package:restro_book/modules/search/view/components/epanded_text_field_widget.dart';
import 'package:get/get.dart';
import 'package:restro_book/modules/search/view/components/occasion_widget.dart';
import 'package:restro_book/modules/search/view/components/phone_number_with_country_code_widget.dart';

class BookingConfirmScreen extends StatelessWidget {
  const BookingConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchFieldController>();
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
                    'La Pizza & La Pasta -Eataly NYC Downtown',
                    style: TextStyles.title22,
                  ),
                  const SizedBoxHeight10(),
                  _partyDescriptionWidget(),
                  const SizedBoxHeight20(),
                  _specialRequestWidget(searchController),
                  const SizedBoxHeight20(),
                  _occasionWidget(),
                  const SizedBoxHeight20(),
                  _phoneWithCountryCodeWidget(),
                  const SizedBoxHeight20(),
                  _reservationUpdateWidget(searchController),
                  const SizedBoxHeight20(),
                  const SizedBoxHeight20(),
                  _mailingAddressWidget(searchController),
                  const SizedBoxHeight20(),
                  const SizedBoxHeight20(),
                  _privacyPolicyWidget(),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: _reserveButton(),
          ),
        ],
      ),
    );
  }

  Widget _partyDescriptionWidget(){
    return Column(
      children: [
        _reservationDetailsWidget(
            Icons.person_outline_outlined, '3 people'),
        _reservationDetailsWidget(
            Icons.calendar_today_outlined, 'Saturday, Nov 4'),
        _reservationDetailsWidget(
            Icons.watch_later_outlined, '7:30 PM'),
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

  Widget _specialRequestWidget(SearchFieldController controller) {
    return ExpandedTextFieldWithTitle(
      title: 'Any special request?',
      hintText: 'Add special request here...',
      controller: controller.specialRequestController,
    );
  }

  Widget _occasionWidget(){
    return const OccasionWidget(title: 'What\'s the occasion?');
  }

  Widget _phoneWithCountryCodeWidget(){
    return const TitleWithPhoneNumberAndCountryCodeWidget(title: 'What\'s your number?');
  }

  Widget _reservationUpdateWidget(SearchFieldController controller){
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
            Obx((){
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
          style: TextStyles.regular12.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _mailingAddressWidget(SearchFieldController controller){
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
            Obx((){
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
          style: TextStyles.regular12.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _privacyPolicyWidget(){
    return Wrap(
      children: [
        TextWidget('By reserving you agree to the RestroBooking ', style: TextStyles.regular12.copyWith(color: strokeColor),),
        TextWidget('Privacy Policy', style: TextStyles.regular12.copyWith(color: primaryColor),),
        TextWidget('and ', style: TextStyles.regular12.copyWith(color: strokeColor),),
        TextWidget('Terms of Use.', style: TextStyles.regular12.copyWith(color: primaryColor),),
      ],
    );
  }

  Widget _reserveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CommonButton(
        height: Dimensions.height50,
        width: Dimensions.screenWidth,
        buttonTitle: 'Reserve',
        buttonTextColor: whiteColor,
        buttonColor: primaryColor,
        onPressed: (){
          //route to another page
        },
      ),
    );
  }
}
