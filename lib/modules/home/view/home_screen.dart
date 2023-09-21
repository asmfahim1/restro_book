import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/const.dart';
import 'package:restro_book/core/utils/styles.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';
import 'package:restro_book/modules/home/view/ecperiences_screen.dart';
import 'package:restro_book/modules/home/view/reservations_screen.dart';
import 'package:restro_book/modules/home/view/takeout_screen.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeController home = Get.put(HomeController());

  void initState() {
    super.initState();
    home.tabController = TabController(length: 3, vsync: this);
    home.tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _topSectionWidget(),
        _bodySectionWidget(),
      ],
    );
  }

  Widget _topSectionWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: size.height / 20,
      width: size.width,
      padding: leftRightPadding15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            'Good morning, Fahim',
            style: TextStyles.title20,
          ),
          const CircleAvatar(
            backgroundColor: strokeColor,
            radius: 15,
            child: Icon(
              Icons.person_outline_rounded,
              color: darkGrayColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodySectionWidget() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 16,
          width: size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 1.2,
              ),
            ),
          ),
          child: TabBar(
            controller: home.tabController,
            isScrollable: false,
            labelColor: primaryColor,
            unselectedLabelColor: darkGrayColor,
            indicatorColor: primaryColor,
            labelPadding: const EdgeInsets.only(left: 0, right: 0),
            tabs: [
              Tab(
                child: TextWidget(
                  "Reservations",
                  style: TextStyles.regular14
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: TextWidget(
                  "Experiences",
                  style: TextStyles.regular14
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: TextWidget(
                  "Delivery & Takeout",
                  style: TextStyles.regular14
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: size.height / 1.38,
          width: size.width,
          child: TabBarView(
            controller: home.tabController,
            children: const [
              ReservationBarScreen(),
              ExperiencesBarScreen(),
              TakeoutBarScreen(),
            ],
          ),
        )
      ],
    );
  }
}
