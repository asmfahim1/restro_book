import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../core/utils/styles.dart';
import '../../controller/search_controller.dart';
import 'discount_card.dart';
import 'f_icon_button.dart';

class FAppBar extends SliverAppBar{
  final BuildContext context;
  final bool isCollapsed;
  final double expandedHeight;
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final SearchFieldController searchCtrl;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

  FAppBar({
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.searchCtrl,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
  }) : super(elevation: 4.0, pinned: true, forceElevated: true);

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
        icon: const Icon(Icons.arrow_back, color: primaryColor,),
      ),
    );
  }

  @override
  List<Widget>? get actions {
    return [
      FIconButton(
        backgroundColor: backgroundColor,
        onPressed: () {},
        icon: const Icon(Icons.share_outlined, color: primaryColor,),
      ),
      FIconButton(
        backgroundColor: backgroundColor,
        onPressed: () {},
        icon: const Icon(Icons.bookmark_border_outlined, color: primaryColor,),
      ),
    ];
  }

  @override
  Widget? get title {
    var textTheme = Theme.of(context).textTheme;
    return AnimatedOpacity(
      opacity: isCollapsed ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      child: TextWidget('STK - San Fransisco', style: TextStyles.title16,),
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
          indicatorWeight: 3.0,
          tabs: searchCtrl.listCategory.map((e) {
            return Tab(text: e.category);
          }).toList(),
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    Size size = MediaQuery.of(context).size;
    List<String> assets = [
      'assets/images/featured_2.JPG',
      'assets/images/featured_1.JPG',
      'assets/images/featured_4.JPG',
      'assets/images/featured_5.png',
      'assets/images/featured_6.jpeg',
      'assets/images/featured_8.jpg',
      'assets/images/featured_9.jpg',
    ];
    return LayoutBuilder(
      builder: (
          BuildContext context,
          BoxConstraints constraints,
          ) {
        final top = constraints.constrainHeight();
        final collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: assets.length,
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
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
                              left: size.width / 3,
                              right: size.width / 3,
                              bottom: 5,
                              child: Container(
                                height: 30,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black45),
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
              const ResNameWithDesc(
                title: 'STK - San Fransisco',
              ),
            ],
          ),
        );
      },
    );
  }
}