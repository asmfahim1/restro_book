import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';

class TitleWithPhoneNumberAndCountryCodeWidget extends StatelessWidget {
  final String title;

  const TitleWithPhoneNumberAndCountryCodeWidget({
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
        SizedBoxHeight10(),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: strokeColor
            ),
          ),
          child: Row(
            children: [
              Container(
                width: size.width / 3.2,
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 30,
                      color: greenColor,
                    ),
                    const SizedBox(width: 5,),
                    TextWidget('(+852)', style: TextStyles.regular12,),
                    const SizedBox(width: 2,),
                    const Icon(Icons.arrow_drop_down, size: 20, color: strokeColor,)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          left: BorderSide(
                              color: strokeColor
                          )
                      )
                  ),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Phone",
                      hintStyle:
                      TextStyles.regular16.copyWith(color: Colors.grey.shade600, fontSize: 17),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
