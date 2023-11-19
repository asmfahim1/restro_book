import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/components/restaurent_details_common_button.dart';

class SliverBodyItems extends StatelessWidget {
  final String categoryIndex;
  final String resName;
  final String resId;
  final ReservationController controller;
  SliverBodyItems(
      {Key? key,
      required this.categoryIndex,
      required this.controller,
      required this.resName,
      required this.resId})
      : super(key: key);

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    if (categoryIndex == 'Reservation') {
      return Material(
        color: whiteColor,
        child: SizedBox(
          height: Dimensions.height100 * 2.45,
          width: Dimensions.screenWidth,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    showModalBottomSheet<dynamic>(
                        context: context,
                        isScrollControlled: true,
                        enableDrag: false,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return _showDateTimeBottomSheet();
                        });
                  },
                  child: Container(
                    height: Dimensions.height30,
                    width: Dimensions.width100 * 1.85,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: strokeColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          size: 14,
                        ),
                        Obx(
                          () => TextWidget(
                            ' ${homeController.noOfMember}',
                            style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 4,
                          width: 4,
                          decoration: const BoxDecoration(
                            color: blackColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Obx(() {
                          return TextWidget(
                            DateFormat('E, MMM d h:mm a')
                                .format(homeController.dateTime),
                            style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: Dimensions.iconSize12,
                      color: blueColor,
                    ),
                    TextWidget(
                      ' Booked 148 times today',
                      style: TextStyles.regular12.copyWith(color: blueColor),
                    )
                  ],
                ),
              ),
              const SizedBoxHeight10(),
              SizedBox(
                height: Dimensions.height35, // Set a fixed height
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true, // Set this to true
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet<dynamic>(
                                  context: context,
                                  isScrollControlled: true,
                                  enableDrag: false,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return _showSeatingOptionBottomSheet(
                                        controller);
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                width: Dimensions.width50 + Dimensions.width35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.table_restaurant_rounded,
                                      size: Dimensions.iconSize12,
                                      color: whiteColor,
                                    ),
                                    TextWidget(
                                      ' 11.30 AM',
                                      style: TextStyles.title32.copyWith(
                                        fontSize: 12,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Container(
                          height: Dimensions.height35,
                          width: Dimensions.width50 + Dimensions.width35,
                          decoration: BoxDecoration(
                            color: cyanColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_alert_outlined,
                                size: Dimensions.iconSize15,
                                color: whiteColor,
                              ),
                              TextWidget(
                                ' Set alert',
                                style: TextStyles.title32.copyWith(
                                  fontSize: 12,
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBoxHeight10(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.table_restaurant_rounded,
                      size: Dimensions.iconSize12,
                    ),
                    TextWidget(
                      ' Additional seating options',
                      style: TextStyles.regular14,
                    )
                  ],
                ),
              ),
              const SizedBoxHeight10(),
              ResDetailsCommonButton(
                buttonName: 'View full availability',
                onTap: () {
                  Get.toNamed(
                    AppRoutes.getViewFullAvailabilityScreen(resId, resName),
                  );
                },
              ),
            ],
          ),
        ),
      );
    } else if (categoryIndex == 'Delivery & Takeout') {
      return Material(
        color: whiteColor,
        child: Container(
          height: Dimensions.height100 + Dimensions.height80,
          width: Dimensions.screenWidth,
          padding: const EdgeInsets.only(left: 15),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'Restaurants options',
                style: TextStyles.regular14,
              ),
              const SizedBoxHeight10(),
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: Container(
                      height: Dimensions.height40,
                      width: Dimensions.width35 * 2 + Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: strokeColor,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: TextWidget(
                        'Order direct',
                        style: TextStyles.title16
                            .copyWith(color: primaryColor, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: Container(
                      height: Dimensions.height40,
                      width: Dimensions.width35 * 2 + Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: strokeColor,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: TextWidget(
                        'Call for takeout',
                        style: TextStyles.title16
                            .copyWith(color: primaryColor, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBoxHeight10(),
              TextWidget(
                'Delivery partners',
                style: TextStyles.regular14,
              ),
              const SizedBoxHeight10(),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: Container(
                  height: Dimensions.height40,
                  width: Dimensions.width35 * 2 + Dimensions.width50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: strokeColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        'Uber',
                        style: TextStyles.title16.copyWith(fontSize: 14),
                      ),
                      TextWidget(
                        'Eats',
                        style: TextStyles.title16
                            .copyWith(color: greenColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (categoryIndex == 'Menu') {
      return Material(
        color: whiteColor,
        child: Container(
          height: Dimensions.heightScreenHalf * 1.33,
          width: Dimensions.screenWidth,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Popular Dishes',
                      style: TextStyles.regular14,
                    ),
                  ],
                ),
              ),
              const SizedBoxHeight20(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (_, index) {
                        return Container(
                          width: Dimensions.screenWidth,
                          padding: const EdgeInsets.only(right: 10),
                          margin: const EdgeInsets.only(left: 15),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: strokeColor))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget('Kyushu Karaage',
                                      style: TextStyles.title16),
                                  TextWidget(
                                      'Japanese style fried chicken red yuzu aioli',
                                      style: TextStyles.regular12),
                                  const SizedBoxHeight20(),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.photo_size_select_actual_outlined,
                                        size: 14,
                                        color: primaryColor,
                                      ),
                                      TextWidget(' 1 photo',
                                          style: TextStyles.regular14),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Icon(
                                        Icons.mode_comment_outlined,
                                        size: 14,
                                        color: primaryColor,
                                      ),
                                      TextWidget(' 4 Reviews',
                                          style: TextStyles.regular14),
                                    ],
                                  ),
                                  const SizedBoxHeight20(),
                                ],
                              ),
                              Container(
                                height: Dimensions.height60,
                                width: Dimensions.width50 + Dimensions.width35,
                                decoration: BoxDecoration(
                                    color: strokeColor,
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        searchedFeatureImagePath,
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
              ResDetailsCommonButton(
                buttonName: 'See full menu',
                onTap: () {
                  Get.toNamed(
                    AppRoutes.getSeeFullMenuScreen(resId, resName),
                  );
                },
              ),
            ],
          ),
        ),
      );
    } else if (categoryIndex == 'Reviews') {
      return Material(
        color: whiteColor,
        child: Container(
          height: Dimensions.screenHeight * 1.45,
          width: Dimensions.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.height100 + Dimensions.height40,
                width: Dimensions.screenWidth,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: strokeColor))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimensions.width180 - Dimensions.width20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            '4.6',
                            style: TextStyles.title22,
                          ),
                          SizedBox(
                              height: Dimensions.height40,
                              width: Dimensions.screenWidth,
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return (index + 1 <= 4)
                                      ? const Icon(Icons.star,
                                          size: 20, color: primaryColor)
                                      : const Icon(Icons.star,
                                          size: 20, color: strokeColor);
                                },
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 5,
                          // shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 20),
                          itemBuilder: (_, index) {
                            int reversedIndex = 5 - index;
                            return Row(
                              children: [
                                TextWidget(
                                  reversedIndex.toString(),
                                  style:
                                      TextStyles.title32.copyWith(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 7,
                                  width: Dimensions.width135,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    border: Border.all(color: strokeColor),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: ((Dimensions.width135) /
                                                5 *
                                                reversedIndex.toDouble() -
                                            2),
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBoxHeight10(),
              Container(
                height: Dimensions.height50,
                width: Dimensions.screenWidth,
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Food',
                          style: TextStyles.regular14,
                        ),
                        TextWidget(
                          '4.6',
                          style: TextStyles.regular14,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Service',
                          style: TextStyles.regular14,
                        ),
                        TextWidget(
                          '4.8',
                          style: TextStyles.regular14,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Ambiance',
                          style: TextStyles.regular14,
                        ),
                        TextWidget(
                          '4.5',
                          style: TextStyles.regular14,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Noise',
                          style: TextStyles.regular14,
                        ),
                        TextWidget(
                          'Moderate',
                          style: TextStyles.regular14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        width: Dimensions.screenWidth,
                        child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            itemBuilder: (_, index) {
                              return Container(
                                height:
                                    Dimensions.height275 - Dimensions.height40,
                                width: Dimensions.screenWidth,
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: strokeColor))),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: orangeColor,
                                          child: TextWidget(
                                            'JN',
                                            style: TextStyles.title16
                                                .copyWith(color: whiteColor),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                      .copyWith(
                                                          color: strokeColor),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Container(
                                                  height: 8,
                                                  width: 8,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: strokeColor,
                                                          shape:
                                                              BoxShape.circle),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                TextWidget(
                                                  '8 reviews',
                                                  style: TextStyles.regular12
                                                      .copyWith(
                                                          color: strokeColor),
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
                                        height: Dimensions.height20 +
                                            Dimensions.height5,
                                        width: Dimensions.screenWidth,
                                        child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (_, index) {
                                            return (index + 1 <= 3)
                                                ? const Icon(Icons.star,
                                                    size: 15,
                                                    color: primaryColor)
                                                : const Icon(Icons.star,
                                                    size: 15,
                                                    color: strokeColor);
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
                      ResDetailsCommonButton(
                        buttonName: 'See all reviews',
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.getSeeAllReviewsScreen(resId, resName),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else if (categoryIndex == 'Details') {
      return Material(
        color: whiteColor,
        child: Container(
          width: Dimensions.screenWidth,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Address',
                      style: TextStyles.regular14,
                    ),
                    const SizedBoxHeight10(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                        SizedBox(
                            width: Dimensions.width225,
                            child: TextWidget(
                              '1 Market St, San Fransisco, CA 94105-1420',
                              style: TextStyles.title16,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBoxHeight10(),
              SizedBox(
                height: Dimensions.height100 + Dimensions.height45,
                width: Dimensions.screenWidth,
                child: Image.asset(
                  restaurantLocationImagePath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBoxHeight10(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Additional informations',
                      style: TextStyles.regular14,
                    ),
                    const SizedBoxHeight10(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextWidget(
                              'Safety information',
                              style: TextStyles.regular16,
                            ),
                            _titleDescription(context,
                                subtitle: 'Surface sanitized after every meal'),
                            _titleDescription(context,
                                subtitle:
                                    'Digital, disposable or sanitized menu provided'),
                            _titleDescription(context,
                                subtitle: 'Common area deep cleaned-daily'),
                            _titleDescription(context,
                                subtitle: 'Contactless payment available'),
                            _titleDescription(context,
                                subtitle:
                                    'Sick staff prohibited in the workplace'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(
                        Icons.phone_enabled_outlined, 'Phone', '(415)375-8094'),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(
                        Icons.price_change_outlined, 'Price', '\$50 and over'),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(
                        Icons.restaurant, 'Cuisine', 'Steakhouse'),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(
                        Icons.access_time_outlined,
                        'Hours of operation',
                        'Brunch\nSat, Sun 10:00 am - 3:00 pm\nLunch\nMon-Fri, Sun 10:00 am - 3:00 pm\nDinner\nMon-Fri, Sun 10:00 am - 3:00 pm\nHappy Hour\nMon-Fri, Sun 10:00 am - 3:00 pm'),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(Icons.payment, 'Payment options',
                        'AMEX, Discover, Mastercard, Visa'),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(
                        Icons.local_parking_outlined, 'Parking', 'None'),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(Icons.person_outline_outlined,
                        'Dress code', 'Business casual'),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(Icons.accessibility,
                        'Accessibility and inclusion', 'Wheelchair Access'),
                    const SizedBoxHeight10(),
                    _additionalInfoSection(
                        Icons.description_sharp,
                        'Description',
                        'STK Steakhouse is "not your daddy\'s steakhouse," offering a high-energy dining experience that artfully combines the superior quality of a traditiona steakhouse with a Vibe Dining atmosphere unlike any other. Delectable cuisine, upscale cocktails and an elevated Happu Hour, along with an in-house DJ and chic decor, all come togather to offer a memorable fine dining experience that keeps guests enjoying their evening from drinks to dinner to late night. STK\'s menu features reimagined classic American cuisine for lunch, brunch and dinner with unique local flair infused into each location\'s menu.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  ///reservation category
  Widget _showDateTimeBottomSheet() {
    DateTime initialDateTime = DateTime.now();
    int initialMinute = initialDateTime.minute;
    if (initialDateTime.minute % 15 != 0) {
      initialMinute = initialDateTime.minute - initialDateTime.minute % 15 + 15;
    }
    return Container(
      height: Dimensions.heightScreenHalf * 1.26,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10),
            child: TextWidget(
              'Party Size',
              style: TextStyles.title16,
            ),
          ),
          const SizedBoxHeight10(),
          SizedBox(
            height: Dimensions.height50,
            child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                controller: homeController.scrollController,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Obx(() {
                      final isSelected =
                          homeController.selectedMemberIndex == index;
                      final containerColor =
                          isSelected ? primaryColor : strokeColor;
                      return GestureDetector(
                        onTap: () {
                          homeController.setSelectedMember(index);
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
          const SizedBoxHeight10(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextWidget(
              'Date and Time',
              style: TextStyles.title16,
            ),
          ),
          const SizedBoxHeight10(),
          SizedBox(
            height: Dimensions.height275 - Dimensions.height40,
            child: CupertinoDatePicker(
                initialDateTime: DateTime(
                    initialDateTime.year,
                    initialDateTime.month,
                    initialDateTime.day,
                    initialDateTime.hour,
                    initialMinute),
                minuteInterval: 15,
                mode: CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (date) {
                  final formattedDate =
                      DateFormat('E, MMM d h:mm a').format(date);
                  print('The picked date and Time is: $formattedDate');
                  homeController.dateTime = date;
                  print(
                      'The picked date and Time is: ${homeController.dateTime}');
                }),
          ),
          _doneButton()
        ],
      ),
    );
  }

  ///reservation category
  Widget _doneButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CommonButton(
        height: Dimensions.height50,
        width: Dimensions.screenWidth,
        buttonTitle: 'Done',
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  ///reservation category
  Widget _showSeatingOptionBottomSheet(ReservationController controller) {
    return Container(
      height: Dimensions.heightScreenHalf * 1.25,
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10),
            child: TextWidget(
              'Select your seating option',
              style: TextStyles.title16,
            ),
          ),
          const SizedBoxHeight10(),
          Expanded(
            child: Container(
              padding: leftRightPadding15,
              child: _seatingListsWidget(controller),
            ),
          ),
          _cancelSeatingButton(controller),
        ],
      ),
    );
  }

  ///reservation category
  Widget _seatingListsWidget(ReservationController controller) {
    return ListView.builder(
      itemCount: seatingOption.length,
      shrinkWrap: true, // Set shrinkWrap to true
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            Get.back();
            Get.toNamed(AppRoutes.getBookingConfirmScreen(resId, resName,
                controller.noOfMember.toString(), controller.dateTime));
          },
          child: Container(
            height: Dimensions.height50,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: strokeColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  seatingOption[index]["title"]!,
                  style: TextStyles.title16,
                ),
                seatingOption[index]["subTitle"]! != " "
                    ? Container(
                        height: Dimensions.height20 + Dimensions.height5,
                        width: Dimensions.width50 + Dimensions.width15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: strokeColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextWidget(
                          seatingOption[index]["subTitle"]!,
                          style: TextStyles.regular12.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }

  ///reservation category
  Widget _cancelSeatingButton(ReservationController controller) {
    return Padding(
      padding: allPadding15,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          Get.back();
        },
        child: Container(
          height: Dimensions.height50,
          width: Dimensions.screenWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: strokeColor, width: 1.2)),
          child: TextWidget(
            'Cancel',
            style: TextStyles.title16,
          ),
        ),
      ),
    );
  }

/*  ///reservation category
  Widget _viewFullAvailabilityBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonButton(
        height: Dimensions.height50,
        width: Dimensions.screenWidth,
        buttonTitle: 'View full availability',
        buttonTextColor: blackColor,
        buttonColor: whiteColor,
        onPressed: () {
          //route to another page
          Get.toNamed(
            AppRoutes.getViewFullAvailabilityScreen(resId, resName),
          );
        },
      ),
    );
  }

  ///menu category
  Widget _seeFullMenuBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonButton(
        height: Dimensions.height50,
        width: Dimensions.screenWidth,
        buttonTitle: 'See full menu',
        buttonTextColor: blackColor,
        buttonColor: whiteColor,
        onPressed: () {
          //route to another page
          Get.toNamed(
            AppRoutes.getSeeFullMenuScreen(resId, resName),
          );
        },
      ),
    );
  }

  ///review category
  Widget _seeAllReviewsBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonButton(
        height: Dimensions.height50,
        width: Dimensions.screenWidth,
        buttonTitle: 'See all reviews',
        buttonTextColor: blackColor,
        buttonColor: whiteColor,
        onPressed: () {
          //route to another page
          Get.toNamed(
            AppRoutes.getSeeAllReviewsScreen(resId, resName),
          );
        },
      ),
    );
  }*/

  ///details category
  Widget _titleDescription(
    BuildContext context, {
    required String subtitle,
    Color? color = blackColor,
  }) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: 5,
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: size.width / 1.5,
          child: TextWidget(
            subtitle,
            style: TextStyles.regular14.copyWith(color: color ?? blackColor),
          ),
        ),
      ],
    );
  }

  ///details category
  Widget _additionalInfoSection(IconData icon, String title, String subTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              title,
              style: TextStyles.regular16,
            ),
            SizedBox(
              width: Dimensions.screenWidth * .85,
              child: TextWidget(
                subTitle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
