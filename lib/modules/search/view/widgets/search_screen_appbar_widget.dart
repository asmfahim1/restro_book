import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../core/utils/exports.dart';

class SearchScreenAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchScreenAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Container(
          height: Dimensions.height30,
          width: Dimensions.width135 + Dimensions.width15,
          decoration: BoxDecoration(
            border: Border.all(color: strokeColor),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_outline_rounded,
                size: Dimensions.iconSize15,
                color: blackColor,
              ),
              const SizedBox(
                width: 5,
              ),
              TextWidget(
                '2 . today at 12:00 PM',
                style: TextStyles.regular12
                    .copyWith(fontWeight: FontWeight.bold, color: blackColor),
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
