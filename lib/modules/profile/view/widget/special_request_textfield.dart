import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';

class SpecialRequestField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const SpecialRequestField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: Dimensions.height35,
          alignment: Alignment.centerLeft,
          child: TextWidget(
            'Special requests',
            style: TextStyles.title16.copyWith(color: primaryColor),
          ),
        ),
        const SizedBoxHeight10(),
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
        const SizedBoxHeight10(),
        TextWidget(
          'Request you add here will be added to every reservation. Restaurants will do their best to accommodate any special requests that you have',
          style: TextStyles.regular12,
        ),
      ],
    );
  }
}
