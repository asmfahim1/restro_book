import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/app_routes.dart';
import 'package:restro_book/core/utils/const.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/styles.dart';
import 'package:restro_book/core/widgets/global_loader.dart';
import 'package:restro_book/modules/home/controller/home_controller.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/reservations_screen.dart';
import 'package:restro_book/modules/home/view/experience_screen/ecperiences_screen.dart';
import 'package:restro_book/modules/home/view/takeout_screen/takeout_screen.dart';

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

  @override
  void initState() {
    super.initState();
    home.getMyLocation();
    home.tabController = TabController(length: 3, vsync: this);
    home.tabController.animateTo(0);
  }

  final DateTime dateTime = DateTime.now();
  String determineMeal() {
    int currentHour = dateTime.hour;
    if (currentHour >= 5 && currentHour < 12) {
      return 'Morning';
    } else if (currentHour >= 12 && currentHour < 16) {
      return 'Afternoon';
    } else if (currentHour >= 16 && currentHour < 24) {
      return 'Evening';
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.height100 * 1.18),
        child: _topSectionWidget(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _bodySectionWidget();
  }

  Widget _topSectionWidget() {
    final String mealName = determineMeal();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          height: Dimensions.screenHeight * .05,
          width: Dimensions.screenWidth,
          padding: leftRightPadding15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                'Good $mealName, Sophie',
                style: TextStyles.title20,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  Get.toNamed(
                    AppRoutes.profileScreen,
                  );
                },
                child: const CircleAvatar(
                  backgroundColor: strokeColor,
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: darkGrayColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        TabBar(
          controller: home.tabController,
          labelColor: primaryColor,
          unselectedLabelColor: darkGrayColor,
          indicatorColor: primaryColor,
          labelPadding: const EdgeInsets.only(left: 0, right: 0),
          tabs: [
            Tab(
              child: TextWidget(
                "Reservations",
                style: TextStyles.regular12
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            Tab(
              child: TextWidget(
                "Experiences",
                style: TextStyles.regular12
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            Tab(
              child: TextWidget(
                "Delivery & Takeout",
                style: TextStyles.regular12
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bodySectionWidget() {
    return Obx(() {
      return home.gettingLocation.value
          ? const Center(child: GlobalLoader())
          : TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: home.tabController,
              children: [
                ReservationBarScreen(
                  homeController: home,
                ),
                const ExperiencesBarScreen(),
                const TakeoutBarScreen(),
              ],
            );
    });
  }
}
