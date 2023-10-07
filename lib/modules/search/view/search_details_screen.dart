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

class _SearchScreenDetailsState extends State<SearchScreenDetails> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
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
              ],
            ),
          ), //SliverList
        ], //<Widget>[]
      )
    );
  }

  Widget _reservationSectionWidget(){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 22,
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: strokeColor),
              )
          ),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: primaryColor,
            unselectedLabelColor: darkGrayColor,
            indicatorColor: primaryColor,
            tabs: List.generate(10, (index){
              return const TabWidget();
            }),
          ),
        ),
        Container(
          height: size.height/ 4.5,
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 12, color: blueColor,),
                    TextWidget(' Booked 148 times today', style: TextStyles.regular12.copyWith(color: blueColor),)
                  ],
                ),
              ),
              const SizedBoxHeight10(),
              SizedBox(
                height: size.height / 28, // Set a fixed height
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
                              height: size.height / 28,
                              width: size.width / 4.2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.table_restaurant_rounded, size: 14, color: whiteColor,),
                                  TextWidget(
                                    ' 11.30 AM',
                                    style: TextStyles.title32.copyWith(
                                      fontSize: 14,
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
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: size.height / 24,
                          width: size.width / 5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: cyanColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextWidget(
                            '11.30 AM',
                            style: TextStyles.title32.copyWith(
                              fontSize: 12,
                              color: whiteColor,
                            ),
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
                    const Icon(Icons.table_restaurant_rounded, size: 12,),
                    TextWidget(' Additional seating options', style: TextStyles.regular14,)
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

  Widget _viewFullAvailabilityBtn(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 20,
      width: size.width / 1.2,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: strokeColor,
              width: 1.2
          )
      ),
      child: TextWidget('View full availability', style: TextStyles.title16,),
    );
  }

  Widget _deliveryTakeoutSectionWidget(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget('Delivery & Takeout', style: TextStyles.title16,),
          TextWidget('Restaurants options', style: TextStyles.regular14,),
          const SizedBoxHeight10(),
          Row(
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: strokeColor,
                  ),
                ),
                alignment: Alignment.center,
                child: TextWidget('Order direct', style: TextStyles.title16.copyWith(color: primaryColor, fontSize: 14),) ,
              ),
              const SizedBox(width: 10,),
              Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: strokeColor,
                  ),
                ),
                alignment: Alignment.center,
                child: TextWidget('Call for takeout', style: TextStyles.title16.copyWith(color: primaryColor, fontSize: 14),) ,
              ),
            ],
          ),
          const SizedBoxHeight10(),
          TextWidget('Delivery partners', style: TextStyles.regular14,),
          const SizedBoxHeight10(),
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: strokeColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget('Uber', style: TextStyles.title16.copyWith(fontSize: 14),),
                TextWidget('Eats', style: TextStyles.title16.copyWith(color: greenColor, fontSize: 14),),
              ],
            ) ,
          ),
        ],
      ),
    );
  }

  Widget _menuSectionWidget(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 430,
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
                TextWidget('Menu', style: TextStyles.title16,),
                TextWidget('Popular Dishes', style: TextStyles.regular14,),
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
                  itemBuilder: (_,index){
                    return Container(
                      width: size.width,
                      padding: EdgeInsets.only(right: 10),
                      margin: const EdgeInsets.only(left: 15),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: strokeColor
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget('Kyushu Karaage', style: TextStyles.title16),
                              TextWidget('Japanese style fried chicken red yuzu aioli', style: TextStyles.regular12),
                              SizedBoxHeight20(),
                              Row(
                                children: [
                                  const Icon(Icons.photo_size_select_actual_outlined, size: 14, color: primaryColor,),
                                  TextWidget(' 1 photo', style: TextStyles.regular14),
                                  SizedBox(width: 20,),
                                  const Icon(Icons.mode_comment_outlined, size: 14, color: primaryColor,),
                                  TextWidget(' 4 Reviews', style: TextStyles.regular14),
                                ],
                              ),
                              SizedBoxHeight20(),
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
                                )
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: _seeFullMenuBtn()),
        ],
      ),
    );
  }

  Widget _seeFullMenuBtn(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 20,
      width: size.width / 1.2,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: strokeColor,
              width: 1.2
          )
      ),
      child: TextWidget('See full menu', style: TextStyles.title16,),
    );
  }
}
