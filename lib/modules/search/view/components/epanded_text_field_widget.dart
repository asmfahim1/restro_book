import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';

class ExpandedTextFieldWithTitle extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;

  const ExpandedTextFieldWithTitle({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
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
        SizedBoxHeight10(),
        SizedBox(
          height: size.height / 8,
          child: TextFormField(
            controller: controller,
            // expands: true,
            minLines: 3,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.regular14,
              focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: strokeColor),
              borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: strokeColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}