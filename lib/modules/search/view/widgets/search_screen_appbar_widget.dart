import 'package:flutter/material.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../core/utils/exports.dart';

class SearchScreenAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchScreenAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Container(
          height: size.height / 24,
          width: size.width / 2.4,
          decoration: BoxDecoration(
            border: Border.all(color: strokeColor),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.person_outline_rounded,
                size: 16,
                color: blackColor,
              ),
              TextWidget(
                '2 . today at 12:00 PM',
                style: TextStyles.title32.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
