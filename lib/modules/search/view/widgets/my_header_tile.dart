import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

const headerTitle = 80.0;
typedef OnHeaderChange = void Function(bool visible);

class MyHeaderTitle extends SliverPersistentHeaderDelegate{
  MyHeaderTitle(
      this.title,
      this.onHeaderChange
      );
  final String title;
  final OnHeaderChange onHeaderChange;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    if(shrinkOffset > 0){
      onHeaderChange(true);
    }else{
      onHeaderChange(false);
    }
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextWidget(
          title,
          style: TextStyles.title16,
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => headerTitle;

  @override
  // TODO: implement minExtent
  double get minExtent => headerTitle;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
  
}