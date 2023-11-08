import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';

class GlobalLoader extends StatelessWidget {
  const GlobalLoader({Key? key, this.text = 'Loading...'}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const  CircularProgressIndicator.adaptive(),
        SizedBox(width: Dimensions.width10),
        Text(text ?? '')
      ],
    );
  }
}