import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';

class GlobalLoader extends StatelessWidget {
  const GlobalLoader({Key? key, this.text = 'Loading...'}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight * .65,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator.adaptive(),
          SizedBox(height: Dimensions.height15),
          TextWidget(text ?? '')
        ],
      ),
    );
  }
}
