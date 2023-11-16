import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
import 'package:restro_book/core/widgets/exports.dart';

class ExperienceFeaturedWidget extends StatelessWidget {
  final String titleOfTheList;
  final bool isViewNeeded;
  final VoidCallback onTap;
  const ExperienceFeaturedWidget(
      {required this.titleOfTheList,
      this.isViewNeeded = true,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.heightScreenHalf * 1.15,
      width: Dimensions.screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: leftRightPadding15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    titleOfTheList,
                    style: TextStyles.title20,
                  ),
                  isViewNeeded
                      ? TextWidget(
                          'VIEW ALL',
                          style:
                              TextStyles.title16.copyWith(color: primaryColor),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: featuredRestaurantList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  final restaurant = featuredRestaurantList[index];
                  return Container(
                    width: Dimensions.width180 * 2 - Dimensions.width10,
                    margin: const EdgeInsets.only(
                        left: 15, right: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 3.0,
                          offset: const Offset(0, 1),
                        )
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Container(
                          height: Dimensions.height100 + Dimensions.height70,
                          width: Dimensions.screenWidth,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      restaurant['restaurantImage'].toString()),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 7, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                restaurant['restaurantName'].toString(),
                                style: TextStyles.title20
                                    .copyWith(color: blackColor),
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    restaurant['restaurantCategory'].toString(),
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
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  TextWidget(
                                    restaurant['restaurantPriceRang']
                                        .toString(),
                                    style: TextStyles.regular12,
                                  ),
                                ],
                              ),
                              TextWidget(
                                restaurant['restaurantMap'].toString(),
                                style: TextStyles.regular12,
                              ),
                              SizedBox(
                                height: Dimensions.height30,
                                width: Dimensions.screenWidth,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      'Tue, Oct 3',
                                      style: TextStyles.regular16,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.screenWidth,
                                child: TextWidget(
                                  restaurant['restaurantBio'].toString(),
                                  style: TextStyles.regular12,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
