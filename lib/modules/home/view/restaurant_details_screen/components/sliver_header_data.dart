import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';

import '../../../../../core/utils/exports.dart';

class SliverHeaderData extends StatelessWidget {
  final Map<String, String> map;
  const SliverHeaderData({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SizedBox(
              height: Dimensions.height20,
              width: Dimensions.screenWidth * .25,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return (index + 1 <= 4)
                      ? const Icon(Icons.star, size: 16, color: primaryColor)
                      : const Icon(Icons.star, size: 16, color: strokeColor);
                },
              ),
            ),
            Container(
              width: Dimensions.screenWidth * 0.6, // Set a specific width
              child: Row(
                children: [
                  const Icon(
                    Icons.mode_comment_outlined,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextWidget(
                    '${map['resReviews']} reviews ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.regular16,
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.price_change_outlined,
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container( // Set a specific width
                  child: TextWidget(
                    '${map['resPricing']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.regular16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.restaurant,
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: Dimensions.screenWidth * 0.5, // Set a specific width
                  child: TextWidget(
                    '${map['resCuisines']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.regular16,
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: Dimensions.screenWidth * 0.8, // Set a specific width
              child: TextWidget(
                '${map['resAddress']}',
                style: TextStyles.regular16,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
