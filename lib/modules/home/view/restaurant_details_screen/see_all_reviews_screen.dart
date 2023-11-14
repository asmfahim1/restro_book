import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/components/search_review_widget.dart';

import '../../../../../../core/utils/exports.dart';

class SeeAllReviewsScreen extends StatelessWidget {
  final String resId;
  final String resName;
  SeeAllReviewsScreen({Key? key, required this.resId, required this.resName})
      : super(key: key);

  final reservationController = Get.find<ReservationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: whiteColor,
            )),
        title: TextWidget(
          'Reviews',
          style: TextStyles.title20.copyWith(color: whiteColor),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SizedBox(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      child: Column(
        children: [
          _topPartWidget(context),
          Expanded(
            child: _listOfReviewsWidget(),
          ),
        ],
      ),
    );
  }

  Widget _topPartWidget(BuildContext context) {
    return Container(
      height: Dimensions.height100 * 1.6,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          const SearchReviewWidget(),
          const SizedBoxHeight20(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                '${seeAllRestaurants.length} reviews',
                style: TextStyles.title16,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  showModalBottomSheet<dynamic>(
                      context: context,
                      isScrollControlled: true,
                      enableDrag: false,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return _showSeatingOptionBottomSheet();
                      });
                },
                child: Container(
                  height: Dimensions.height30,
                  width: Dimensions.width135,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: strokeColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        'Most recent',
                        style: TextStyles.regular12
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: Dimensions.width20,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: Dimensions.iconSize15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listOfReviewsWidget() {
    return SizedBox(
      width: Dimensions.screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: seeAllRestaurants.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return Container(
                height: Dimensions.height275 - Dimensions.height40,
                width: Dimensions.screenWidth,
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: strokeColor))),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: orangeColor,
                          child: TextWidget(
                            'JN',
                            style:
                                TextStyles.title16.copyWith(color: whiteColor),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              'JohnN',
                              style: TextStyles.regular16,
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  'San Fransisco',
                                  style: TextStyles.regular12
                                      .copyWith(color: strokeColor),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: const BoxDecoration(
                                      color: strokeColor,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                TextWidget(
                                  '8 reviews',
                                  style: TextStyles.regular12
                                      .copyWith(color: strokeColor),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        TextWidget(
                          'Dined 7 days ago',
                          style: TextStyles.regular12,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: Dimensions.height20 + Dimensions.height5,
                        width: Dimensions.screenWidth,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return (index + 1 <= 3)
                                ? const Icon(Icons.star,
                                    size: 15, color: primaryColor)
                                : const Icon(Icons.star,
                                    size: 15, color: strokeColor);
                          },
                        )),
                    const SizedBoxHeight10(),
                    TextWidget(
                      'The staff was very good at taking care of us. However, the food was just another sushi place super expensive nothing extraordinary. Overall I wouldn\'t go back since they\'re 70 sushi places I could go to. I don\'t really understand why people here other than it\'s a place tp go after work or people want to go walk waterfront after dinner',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.regular14,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _showSeatingOptionBottomSheet() {
    return Container(
      height: Dimensions.heightScreenHalf * .9,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        children: [
          TextWidget(
            'Sort Reviews By',
            style: TextStyles.title16,
          ),
          const SizedBoxHeight20(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _sortReviewsWidget(),
              ],
            ),
          ),
          const SizedBoxHeight20(),
          _cancelSortReviewByButton(),
        ],
      ),
    );
  }

  ///reservation category
  Widget _sortReviewsWidget() {
    return ListView.builder(
      itemCount: sortReviewsBy.length,
      shrinkWrap: true, // Set shrinkWrap to true
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: Dimensions.height70,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: strokeColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  sortReviewsBy[index]["title"]!,
                  style: TextStyles.title16,
                ),
                sortReviewsBy[index]["marked"] == "Yes"
                    ? const Icon(
                        Icons.done_outlined,
                        size: 30,
                        color: strokeColor,
                      )
                    : const SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }

  ///reservation category
  Widget _cancelSortReviewByButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CommonButton(
        width: Dimensions.screenWidth,
        buttonTitle: 'Cancel',
        buttonTextColor: blackColor,
        buttonColor: whiteColor,
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
