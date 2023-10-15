import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class TabWidget extends StatelessWidget {
  final int indexNo;
  const TabWidget({
    this.indexNo = 1,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(indexNo == 0){
      return TextWidget(
        'Reservation',
        style: TextStyles.regular12
            .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
      );
    }else if(indexNo == 1){
      return TextWidget(
        'Deliver & Takeout',
        style: TextStyles.regular12
            .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
      );
    }else if(indexNo == 2){
      return TextWidget(
        'Menu',
        style: TextStyles.regular12
            .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
      );
    }else if(indexNo == 3){
      return TextWidget(
        'Review',
        style: TextStyles.regular12
            .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
      );
    }else if(indexNo == 4){
      return TextWidget(
        'Details',
        style: TextStyles.regular12
            .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
      );
    }else{
      return TextWidget(
        'Reservation',
        style: TextStyles.regular12
            .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
      );
    }
  }
}
