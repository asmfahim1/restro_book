import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      "Reservations",
      style: TextStyles.regular12
          .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
    );
  }
}
