import 'package:flutter/material.dart';
import 'package:restro_book/core/widgets/exports.dart';
import '../../../../core/utils/exports.dart';

class SliverHeaderData extends StatelessWidget {
  const SliverHeaderData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SizedBox(
              height: size.height / 40,
              width: size.width / 4,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return (index + 1 <= 4)
                      ? const Icon(Icons.star,
                      size: 14, color: primaryColor)
                      : const Icon(Icons.star,
                      size: 14, color: strokeColor);
                },
              ),
            ),
            Row(
              children: [
                const Icon(Icons.mode_comment_outlined, size: 14,),
                const SizedBox(width: 5,),
                TextWidget('803 reviews ', style: TextStyles.regular12,),
              ],
            )
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                const Icon(Icons.price_change_outlined, size: 14,),
                const SizedBox(width: 5,),
                TextWidget('\$50 and over ', style: TextStyles.regular12,),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.restaurant, size: 14,),
                const SizedBox(width: 5,),
                TextWidget('Steakhouse ', style: TextStyles.regular12,),
              ],
            )
          ],
        ),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, size: 14,),
            const SizedBox(width: 5,),
            TextWidget('1 Market St, San Fransisco, CA, 941051420 '),
          ],
        )
      ],
    );
  }
}
