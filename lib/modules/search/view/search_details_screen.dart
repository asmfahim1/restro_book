import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';
import 'package:restro_book/modules/search/controller/search_controller.dart';
import 'package:restro_book/modules/search/view/widgets/list_item_header_sliver.dart';
import 'package:restro_book/modules/search/view/widgets/my_header_tile.dart';
import 'package:restro_book/modules/search/view/widgets/sliver_body_item.dart';
import 'package:restro_book/modules/search/view/widgets/sliver_header_data.dart';
import '../../../core/utils/exports.dart';

class SearchScreenDetails extends StatefulWidget {
  const SearchScreenDetails({Key? key}) : super(key: key);

  @override
  State<SearchScreenDetails> createState() => _SearchScreenDetailsState();
}

class _SearchScreenDetailsState extends State<SearchScreenDetails> {
  SearchFieldController searchController = Get.put(SearchFieldController());

  @override
  void initState() {
    searchController.onInit();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: searchController.globalOffsetValue,
            builder: (_, double valueCurrentScroll, __) {
              return Scrollbar(
                notificationPredicate: (scroll) {
                  searchController.valueScroll.value =
                      scroll.metrics.extentInside;
                  return true;
                },
                radius: const Radius.circular(8),
                child: CustomScrollView(
                  controller: searchController.scrollControllerGlobally,
                  slivers: [
                    _FlexibleSpaceBarHeader(
                      valueScroll: valueCurrentScroll,
                      controller: searchController,
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _HeaderSliver(searchController),
                    ),
                    for (var i = 0;
                        i < searchController.listOfCategories.length;
                        i++) ...[
                      SliverPersistentHeader(
                        delegate: MyHeaderTitle(
                          searchController.listCategory[i].category,
                          (visible) => searchController.refreshHeader(i, visible, lastIndex: i > 0 ? i - 1 : null),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SliverBodyItems(
                          categoryIndex: searchController.listCategory[i].category,
                          controller: searchController,
                        ),
                      ),
                    ]
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class _FlexibleSpaceBarHeader extends StatelessWidget {
  const _FlexibleSpaceBarHeader(
      {Key? key, required this.valueScroll, required this.controller})
      : super(key: key);
  final double valueScroll;
  final SearchFieldController controller;
  @override
  Widget build(BuildContext context) {
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
    return SliverAppBar(
      expandedHeight: 240,
      backgroundColor: whiteColor,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [StretchMode.zoomBackground],
        background: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
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
            Positioned(
              top: 10,
              left: 8,
              child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: 25,
                  color: whiteColor,
                ),
              ),
            ),
            const Positioned(
              top: 10,
              right: 16,
              child: Icon(
                Icons.bookmark_border_outlined,
                size: 25,
                color: whiteColor,
              ),
            ),
            const Positioned(
              top: 10,
              right: 76,
              child: Icon(
                Icons.share_outlined,
                size: 25,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _maxHeaderExtent = 100.0;

class _HeaderSliver extends SliverPersistentHeaderDelegate {
  final SearchFieldController controller;

  _HeaderSliver(this.controller);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    if(percent > 0.1){
      controller.visibleHeader.value = true;
    }else{
      controller.visibleHeader.value = false;
    }
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: _maxHeaderExtent,
            color: whiteColor,
            child: Column(
              children: [
                const SizedBoxHeight10(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AnimatedOpacity(
                        opacity: percent > 0.1 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            size: 25,
                            color: percent > 0.1 ? primaryColor : whiteColor,
                          ),
                        ),
                      ),
                    ),
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 300),
                      offset: Offset(percent < 0.1 ? -0.22 : 0.002, 0),
                      curve: Curves.easeIn,
                      child: TextWidget(
                        'STK - San Fransisco',
                        style: TextStyles.title20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AnimatedOpacity(
                        opacity: percent > 0.1 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.share_outlined,
                          size: 25,
                          color: percent > 0.1 ? primaryColor : whiteColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AnimatedOpacity(
                        opacity: percent > 0.1 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.bookmark_border_outlined,
                          size: 25,
                          color: percent > 0.1 ? primaryColor : whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: percent > 0.1
                          ? ListItemHeaderSliver(controller: controller)
                          : const SliverHeaderData(),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (percent > 0.1)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: percent > 0.1
                  ? Container(
                      height: 2,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: strokeColor,
                            blurRadius: 1,
                            offset: Offset(1, 2)
                          )
                        ]
                      ),
                    )
                  : null,
            ),
          )
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _maxHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
