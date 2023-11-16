import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../core/utils/exports.dart';

class ProfileTopSectionWidget extends StatelessWidget {
  const ProfileTopSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height100 * 2.21,
      width: Dimensions.screenWidth,
      padding: allPadding15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                height: Dimensions.height100 * 1.2,
                width: Dimensions.width100 * 1.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
                  child: const Image(
                    image: AssetImage(profileImagePath),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: Dimensions.height35,
                  width: Dimensions.width35,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20 * 5),
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    color: whiteColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          TextWidget(
            'Skylar Sophie',
            style: TextStyles.title20,
          ),
          TextWidget(
            'Member since August 2023',
          ),
          const SizedBoxHeight20(),
        ],
      ),
    );
  }
}
