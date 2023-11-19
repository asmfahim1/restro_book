import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
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
          itemCount: featuredRestaurantList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: strokeColor, width: 2))),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width225,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              featuredRestaurantList[index]["restaurantName"]
                                  .toString(),
                              style: TextStyles.title16,
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  '${featuredRestaurantList[index]["restaurantReviews"].toString()} reviews',
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
                                  featuredRestaurantList[index]
                                          ["restaurantPriceRang"]
                                      .toString(),
                                  style: TextStyles.regular12,
                                ),
                              ],
                            ),
                            TextWidget(
                              '(Confirmed)',
                              style: TextStyles.regular12.copyWith(
                                color: greenColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: Dimensions.height50,
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
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
                                    'Oct ${14 + index}',
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
                                      '11:${index + 10} AM',
                                      style: TextStyles.regular14.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
