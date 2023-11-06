import 'package:flutter/material.dart';

import '../../../../core/utils/exports.dart';

class CustomSwitch extends StatelessWidget {
  final void Function()? onTap;
  final Color containerColor;
  const CustomSwitch({
    required this.onTap,
    required this.containerColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 22,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: containerColor,
          border: Border.all(color: primaryColor, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 15,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: primaryColor,
                ),
              ),
              Container(
                width: 15,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: strokeColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
