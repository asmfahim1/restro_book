import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class ExperieneFeaturedWidget extends StatelessWidget {
  final String titleOfTheList;
  final bool isViewNeeded;
  final VoidCallback onTap;
  final int listItemLength;
  final String restaurantName;
  final String restaurantCategory;
  final String price;
  final String resLocation;
  const ExperieneFeaturedWidget(
      {
        required this.titleOfTheList,
        this.isViewNeeded = true,
        required this.onTap,
        required this.listItemLength,
        required this.restaurantName,
        required this.restaurantCategory,
        required this.price,
        required this.resLocation,
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
                itemCount: listItemLength,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
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
                          height: size.height / 3.8,
                          width: size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(featuredImagePath,),
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
                                restaurantName,
                                style: TextStyles.title16.copyWith(color: blackColor),
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    restaurantCategory,
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
                                    price,
                                    style: TextStyles.regular12,
                                  ),
                                ],
                              ),
                              TextWidget(
                                resLocation,
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
                                child: TextWidget('Our most luxurious tasting menu, Take a journey with us as we celebrate our local farmers, finishing boats, as well as flavors from around the globe as ...', style: TextStyles.regular12,),
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
