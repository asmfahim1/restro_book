import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';

class OccasionWidget extends StatelessWidget {
  final String title;

  const OccasionWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 22,
          alignment: Alignment.centerLeft,
          child: TextWidget(
            title,
            style: TextStyles.title16,
          ),
        ),
        const SizedBoxHeight10(),
        SizedBox(
          height: size.height / 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _occasionNameWidget('Birthday'),
                  _occasionNameWidget('Anniversary'),
                  _occasionNameWidget('Date'),
                  _occasionNameWidget('Special Occasion'),
                ],
              ),
              _occasionNameWidget('Business Meal'),
            ],
          ),
        ),
      ],
    );
  }
  Widget _occasionNameWidget(String title){
    return Container(
      height: 25,
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: strokeColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextWidget(title, style: TextStyles.regular12.copyWith(fontWeight: FontWeight.bold),),
    );
  }
}
