import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import '../../../../core/widgets/text_widget.dart';

class FilterContainerWidget extends StatelessWidget {
  final double width;
  final bool isTextNeeded;
  final String filterName;
  const FilterContainerWidget(
      {
      required this.width,
      this.isTextNeeded = false,
      this.filterName = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 24,
      width: width,
      margin: EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: strokeColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: isTextNeeded
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(filterName, style: TextStyles.regular12,),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 20,
                  ),
                ],
              ),
          )
          : Image.asset(
              filterImagePath,
              height: size.height / 45,
            ),
    );
  }
}
