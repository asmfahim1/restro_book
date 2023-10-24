import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class ExperieneFeaturedWidget extends StatelessWidget {
  final String titleOfTheList;
  final bool isViewNeeded;
  final VoidCallback onTap;
  const ExperieneFeaturedWidget(
      {
        required this.titleOfTheList,
        this.isViewNeeded = true,
        required this.onTap,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.6,
      width: size.width,
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
                itemCount: restaurantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final restaurant = restaurantList[index];
                  return Container(
                    width: size.width / 1.02,
                    margin: const EdgeInsets.only(left: 15,right: 10, top: 10, bottom: 10),
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
                          height: size.height / 3.5,
                          width: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(restaurant['restaurantImage'].toString()),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 7, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                restaurant['restaurantName'].toString(),
                                style: TextStyles.title16.copyWith(color: blackColor),
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
                                      color: strokeColor,
                                      shape: BoxShape.circle
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  TextWidget(
                                    restaurant['restaurantPriceRang'].toString(),
                                    style: TextStyles.regular12,
                                  ),
                                ],
                              ),
                              TextWidget(
                                restaurant['restaurantMap'].toString(),
                                style: TextStyles.regular12,
                              ),
                              SizedBox(
                                height: size.height / 20,
                                width: size.width,
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today_outlined, size: 16,),
                                    const SizedBox(width: 10,),
                                    TextWidget('Tue, Oct 3', style: TextStyles.regular16,)
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width,
                                child: TextWidget(
                                  restaurant['restaurantBio'].toString(),
                                  style: TextStyles.regular12,
                                  maxLines: 4,
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
