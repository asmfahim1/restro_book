import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
          'History',
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
          itemCount: featuredRestaurantList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            final restaurant = featuredRestaurantList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                elevation: 5,
                color: Colors.yellow,
                shadowColor: primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                child: _historyDetailsWidget(
                  restaurant["restaurantName"].toString(),
                  restaurant["restaurantAddress"].toString(),
                  restaurant["restaurantImage"].toString(),
                  '${index + 2}',
                  'Nov 1${index + 3}, 2023',
                  '8:45 PM',
                  restaurant["restaurantBio"].toString(),
                ),
              ),
            );
          }),
    );
  }

  Widget _historyDetailsWidget(
      String resName,
      String restaurantAddress,
      String cardImage,
      String member,
      String date,
      String time,
      String restBio) {
    return Column(
      children: [
        ListTile(
          title: TextWidget(
            resName,
            style: TextStyles.title20,
          ),
          subtitle: TextWidget(restaurantAddress),
          trailing: const Icon(Icons.favorite_outline),
        ),
        _visitInfo(Icons.person_outlined, '$member  Persons visited last time'),
        Row(
          children: [
            _visitInfo(Icons.calendar_today, date),
            SizedBox(
              width: Dimensions.width20,
            ),
            _visitInfo(Icons.access_time, time),
          ],
        ),
        SizedBoxHeight10(),
        Container(
          height: Dimensions.height100 * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            cardImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: TextWidget(restBio),
        ),
        ButtonBar(
          children: [
            TextButton(
              child: const Text('Feedback'),
              onPressed: () {/* ... */},
            )
          ],
        )
      ],
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
