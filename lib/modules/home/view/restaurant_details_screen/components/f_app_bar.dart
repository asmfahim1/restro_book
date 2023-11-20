import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/utils/restaurant_resources.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'f_icon_button.dart';
import 'res_name_with_description.dart';

class FAppBar extends SliverAppBar {
  final Map<String, String> map;
  final BuildContext context;
  final bool isCollapsed;
  final double expandedHeight;
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final ReservationController reserveCtrl;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

  const FAppBar({
    super.key,
    required this.map,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.reserveCtrl,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
  }) : super(elevation: 1.0, pinned: true, forceElevated: true);

  @override
  Color? get backgroundColor => Colors.white;

  @override
  Widget? get leading {
    return Center(
      child: FIconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: backgroundColor,
        icon: const Icon(
          Icons.arrow_back,
          color: primaryColor,
        ),
      ),
    );
  }

  @override
  List<Widget>? get actions {
    return [
      FIconButton(
        backgroundColor: backgroundColor,
        onPressed: () {},
        icon: const Icon(
          Icons.share_outlined,
          color: primaryColor,
        ),
      ),
      FIconButton(
        backgroundColor: backgroundColor,
        onPressed: () {},
        icon: const Icon(
          Icons.bookmark_border_outlined,
          color: primaryColor,
        ),
      ),
    ];
  }

  @override
  Widget? get title {
    return AnimatedOpacity(
      opacity: isCollapsed ? 0 : 1,
      duration: const Duration(milliseconds: 300),
      child: TextWidget(
        map['resName'] ?? '',
        style: TextStyles.title20,
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        color: Colors.white,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: primaryColor,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorWeight: 2.0,
          tabs: reserveCtrl.listOfCategories.map((e) {
            return Tab(text: e);
          }).toList(),
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final top = constraints.constrainHeight();
        final collapsedHeight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHeight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            children: [
              SizedBox(
                height: Dimensions.height100 * 2.8,
                width: Dimensions.screenWidth,
                child: PageView.builder(
                  itemCount: assets.length,
                  physics: const BouncingScrollPhysics(),
                  controller: PageController(initialPage: 3),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              assets[index],
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              left: Dimensions.screenWidth * 0.32,
                              right: Dimensions.screenWidth * 0.32,
                              bottom: 5,
                              child: Container(
                                height: Dimensions.height30,
                                width: Dimensions.width50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black38,
                                ),
                                child: TextWidget(
                                  'See all 405 photos',
                                  style: TextStyles.regular12
                                      .copyWith(color: whiteColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              ResNameWithDesc(
                map: map,
              ),
            ],
          ),
        );
      },
    );
  }
}
