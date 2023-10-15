import 'package:flutter/material.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/search/view/widgets/search_details_sliver_appbar.dart';
import 'package:restro_book/modules/search/view/widgets/tabbar_widget.dart';
import '../../../core/utils/exports.dart';

class SearchScreenDetails extends StatefulWidget {
  const SearchScreenDetails({Key? key}) : super(key: key);

  @override
  State<SearchScreenDetails> createState() => _SearchScreenDetailsState();
}

class _SearchScreenDetailsState extends State<SearchScreenDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SearchDetailsSliverAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _reservationSectionWidget(),
                  _deliveryTakeoutSectionWidget(),
                  _menuSectionWidget(),
                  _reviewSectionWidget(),
                  _detailsSectionWidget(),
                ],
              ),
            ), //SliverList
          ], //<Widget>[]
        ));
  }

  Widget _reservationSectionWidget() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 16,
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: strokeColor),
              )),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: primaryColor,
            unselectedLabelColor: darkGrayColor,
            indicatorColor: primaryColor,
            tabs: List.generate(5, (index) {
              return TabWidget(indexNo: index,);
            }),
          ),
        ),
        Container(
          height: size.height / 3.6,
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 12,
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
                height: size.height / 24, // Set a fixed height
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true, // Set this to true
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              width: size.width / 4.2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.table_restaurant_rounded,
                                    size: 12,
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
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Container(
                          height: size.height / 24,
                          width: size.width / 4.2,
                          decoration: BoxDecoration(
                            color: cyanColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add_alert_outlined,
                                size: 14,
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
                    const Icon(
                      Icons.table_restaurant_rounded,
                      size: 12,
                    ),
                    TextWidget(
                      ' Additional seating options',
                      style: TextStyles.regular14,
                    )
                  ],
                ),
              ),
              const SizedBoxHeight10(),
              _viewFullAvailabilityBtn(),
            ],
          ),
        )
      ],
    );
  }

  Widget _viewFullAvailabilityBtn() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 16,
      width: size.width / 1.2,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: strokeColor, width: 1.2)),
      child: TextWidget(
        'View full availability',
        style: TextStyles.title16,
      ),
    );
  }

  Widget _deliveryTakeoutSectionWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 4,
      width: size.width,
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            'Delivery & Takeout',
            style: TextStyles.title16,
          ),
          TextWidget(
            'Restaurants options',
            style: TextStyles.regular14,
          ),
          const SizedBoxHeight10(),
          Row(
            children: [
              Container(
                height: size.height / 20,
                width: size.width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
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
              const SizedBox(
                width: 10,
              ),
              Container(
                height: size.height / 20,
                width: size.width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
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
            ],
          ),
          const SizedBoxHeight10(),
          TextWidget(
            'Delivery partners',
            style: TextStyles.regular14,
          ),
          const SizedBoxHeight10(),
          Container(
            height: size.height / 20,
            width: size.width / 3,
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
        ],
      ),
    );
  }

  Widget _menuSectionWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.7,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  'Menu',
                  style: TextStyles.title16,
                ),
                TextWidget(
                  'Popular Dishes',
                  style: TextStyles.regular14,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Container(
                      width: size.width,
                      padding: const EdgeInsets.only(right: 10),
                      margin: const EdgeInsets.only(left: 15),
                      decoration: const BoxDecoration(
                          border:
                          Border(bottom: BorderSide(color: strokeColor))),
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
                            height: size.height / 12,
                            width: size.width / 4,
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
          Align(alignment: Alignment.center, child: _seeFullMenuBtn()),
        ],
      ),
    );
  }

  Widget _seeFullMenuBtn() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 16,
      width: size.width / 1.2,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: strokeColor, width: 1.2)),
      child: TextWidget(
        'See full menu',
        style: TextStyles.title16,
      ),
    );
  }

  Widget _reviewSectionWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 1.7,
      width: size.width,
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            'Reviews',
            style: TextStyles.title16,
          ),
          Container(
            height: size.height / 4,
            width: size.width,
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: strokeColor))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width / 2.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        '4.6',
                        style: TextStyles.title32,
                      ),
                      SizedBox(
                          height: size.height / 20,
                          width: size.width,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return (index + 1 <= 4)
                                  ? const Icon(Icons.star,
                                  size: 30, color: primaryColor)
                                  : const Icon(Icons.star,
                                  size: 30, color: strokeColor);
                            },
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: size.height,
                    width: size.width / 2.5,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          int reversedIndex = 5 - index;
                          return Row(
                            children: [
                              Container(
                                  height: size.height / 24,
                                  width: size.width / 18,
                                  alignment: Alignment.centerRight,
                                  child: TextWidget(
                                    reversedIndex.toString(),
                                    style: TextStyles.title16,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: size.height / 100,
                                width: size.width / 2.7,
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
                                      width: ((size.width / 2.7) /
                                          5 *
                                          reversedIndex.toDouble() -
                                          2),
                                      color: primaryColor,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 13,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Food',
                      style: TextStyles.regular16,
                    ),
                    TextWidget(
                      '4.6',
                      style: TextStyles.regular16,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Service',
                      style: TextStyles.regular16,
                    ),
                    TextWidget(
                      '4.8',
                      style: TextStyles.regular16,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Ambiance',
                      style: TextStyles.regular16,
                    ),
                    TextWidget(
                      '4.5',
                      style: TextStyles.regular16,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Noise',
                      style: TextStyles.regular16,
                    ),
                    TextWidget(
                      'Moderate',
                      style: TextStyles.regular16,
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
                    width: size.width,
                    child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Container(
                            height: size.height / 2.5,
                            width: size.width,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: strokeColor))),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: orangeColor,
                                      child: TextWidget(
                                        'JN',
                                        style: TextStyles.title20
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
                                const SizedBoxHeight10(),
                                SizedBox(
                                    height: size.height / 20,
                                    width: size.width,
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
                                Text(
                                  'The staff was very good at taking care of us. However, the food was just another sushi place super expensive nothing extraordinary. Overall I wouldn\'t go back since they\'re 70 sushi places I could go to. I don\'t really understand why people here other than it\'s a place tp go after work or people want to go walk waterfront after dinner',
                                  style: TextStyles.regular14,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  _seeAllReviewsBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _seeAllReviewsBtn() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 16,
      width: size.width / 1.2,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: strokeColor, width: 1.2)),
      child: TextWidget(
        'See all reviews',
        style: TextStyles.title16,
      ),
    );
  }

  Widget _detailsSectionWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  'Details',
                  style: TextStyles.title16,
                ),
                TextWidget(
                  'Address',
                  style: TextStyles.regular14,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 30,
                    ),
                    Container(
                        width: size.width / 1.6,
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
            height: size.height / 5.5,
            width: size.width,
            child: Image.asset(
              restaurantLocationImagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBoxHeight10(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        _titleDescription(
                            subtitle: 'Surface sanitized after every meal'),
                        _titleDescription(
                            subtitle:
                            'Digital, disposable or sanitized menu provided'),
                        _titleDescription(
                            subtitle: 'Common area deep cleaned-daily'),
                        _titleDescription(
                            subtitle: 'Contactless payment available'),
                        _titleDescription(
                            subtitle: 'Sick staff prohibited in the workplace'),
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
                _additionalInfoSection(Icons.description_sharp, 'Description',
                    'STK Steakhouse is "not your daddy\'s steakhouse," offering a high-energy dining experience that artfully combines the superior quality of a traditiona steakhouse with a Vibe Dining atmosphere unlike any other. Delectable cuisine, upscale cocktails and an elevated Happu Hour, along with an in-house DJ and chic decor, all come togather to offer a memorable fine dining experience that keeps guests enjoying their evening from drinks to dinner to late night. STK\'s menu features reimagined classic American cuisine for lunch, brunch and dinner with unique local flair infused into each location\'s menu.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleDescription({
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
            style: TextStyles.regular14
                .copyWith(color: color == null ? blackColor : color),
          ),
        ),
      ],
    );
  }

  Widget _additionalInfoSection(IconData icon, String title, String subTitle) {
    Size size = MediaQuery.of(context).size;
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
                width: size.width / 1.3,
                child: TextWidget(subTitle, style: TextStyles.regular14)),
          ],
        ),
      ],
    );
  }
}
