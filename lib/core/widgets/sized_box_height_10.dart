import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';

class SizedBoxHeight10 extends StatelessWidget {
  const SizedBoxHeight10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height10,
    );
  }
}