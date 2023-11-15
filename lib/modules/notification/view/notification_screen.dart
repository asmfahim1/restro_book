import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextWidget(
          'Notifications',
          style: TextStyles.title20.copyWith(),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      padding: leftRightPadding10,
      child: ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                elevation: 5,
                color: Colors.lightGreen,
                shadowColor: primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        '🌟 Reservation Confirmed: ',
                        style: TextStyles.title16,
                      ),
                      TextWidget(
                        'We\'re delighted to confirm your reservation for Nov, 13 at 08: 45 PM for 5 persons. Your table is all set, and we can\'t wait to serve you a delightful meal.',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _visitInfo(Icons.calendar_today, 'Nov, 13'),
                          _visitInfo(Icons.access_time, '08: 45 PM'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _visitInfo(IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
            color: primaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          TextWidget(
            info,
            style: TextStyles.regular12,
          ),
        ],
      ),
    );
  }
}
