import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/search/controller/search_controller.dart';
import 'package:restro_book/modules/search/model/my_header.dart';
import 'package:restro_book/modules/search/view/widgets/get_box_offset.dart';


class ListItemHeaderSliver extends StatelessWidget {
  final SearchFieldController controller;
  const ListItemHeaderSliver({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final itemOffsets = controller.listOffsetItemHeader;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: ((notification) => true),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: size.width - (itemOffsets[itemOffsets.length - 1] - itemOffsets[itemOffsets.length - 2]),),
          controller: controller.scrollControllerCategoryHeader,
          scrollDirection: Axis.horizontal,
          //physics: const NeverScrollableScrollPhysics(),
          child: ValueListenableBuilder(
            valueListenable: controller.headerNotifier,
            builder: (_, MyHeader? snapshot, __) {
              return Row(
                children: List.generate(
                controller.listOfCategories.length,
                        (index) {
                        return GetBoxOffset(
                          offset: ((offset) => itemOffsets[index] = offset.dx),
                          child: Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 12, right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == snapshot!.index ? primaryColor : null,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: TextWidget(
                              controller.listOfCategories[index],
                              style: TextStyles.title16.copyWith(
                                fontSize: 14,
                                color: index == snapshot.index ? whiteColor : blackColor
                              ),
                            ),
                          ),
                        );
                    }),
              );
            }
          ),
        ),
      ),
    );
  }
}
