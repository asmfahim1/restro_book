import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'components/category_section.dart';
import 'components/f_app_bar.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final String resName;
  final String resId;
  const RestaurantDetailsScreen(
      {Key? key, required this.resName, required this.resId})
      : super(key: key);

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen>
    with SingleTickerProviderStateMixin {
  final reservationController = Get.put(ReservationController());

  late AutoScrollController scrollController;
  late TabController tabController;

  final double expandedHeight = Dimensions.heightScreenHalf * .82;
  final double collapsedHeight = kToolbarHeight;

  final listViewKey = RectGetter.createGlobalKey();
  Map<int, dynamic> itemKeys = {};

  // prevent animate when press on tab bar
  bool pauseRectGetterIndex = false;

  bool isCollapsed = false;

  @override
  void initState() {
    // getData();
    tabController = TabController(
        length: reservationController.listOfCategories.length, vsync: this);
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(listViewKey);
    List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  void onCollapsed(bool value) {
    if (isCollapsed == value) return;
    setState(() => isCollapsed = value);
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    int lastTabIndex = tabController.length - 1;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else if (visibleItems.isNotEmpty) {
      int sumIndex = visibleItems.reduce((value, element) => value + element);
      int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex) {
        tabController.animateTo(middleIndex);
      }
    }
    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: whiteColor,
      body: RectGetter(
        key: listViewKey,
        child: NotificationListener<ScrollNotification>(
            onNotification: onScrollNotification,
            child: buildSliverScrollView()),
      ),
    );
  }

  Widget buildSliverScrollView() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      slivers: [
        buildAppBar(),
        buildBody(),
      ],
    );
  }

  SliverAppBar buildAppBar() {
    return FAppBar(
      resName: widget.resName,
      context: context,
      scrollController: scrollController,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: (index) => animateAndScrollTo(index),
      reserveCtrl: reservationController,
    );
  }

  SliverList buildBody() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => buildCategoryItem(index),
        childCount: reservationController.listOfCategories.length,
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    itemKeys[index] = RectGetter.createGlobalKey();
    // Menu menuData = widget.menu[index];
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        child: CategorySection(
          index: index,
          controller: reservationController,
          resName: widget.resName,
          resId: widget.resId,
        ),
      ),
    );
  }
}
