import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/core/widgets/sized_box_height_10.dart';

class TitleWithListViewWidget extends StatelessWidget {
  final Widget? bookMarkButton;
  final String imageUrl;
  final String restaurantName;
  final String restaurantCategory;
  final String restaurantRate;
  final VoidCallback onTap;
  final bool timeWithTitle;
  final double timeContainerHeight;
  final double timeContainerWidth;
  final String startTime;
  final String midTime;
  final String endTime;
  /* final String startPts;
  final String midPts;
  final String endPts;*/
  const TitleWithListViewWidget(
      {this.bookMarkButton,
      required this.imageUrl,
      required this.restaurantName,
      required this.onTap,
      this.restaurantCategory = 'Steakhouse',
      this.restaurantRate = '4.6',
      this.timeWithTitle = true,
      required this.timeContainerHeight,
      required this.timeContainerWidth,
      this.startTime = '00:00 AM',
      this.midTime = '00:00 AM',
      this.endTime = '00:00 AM',
      /*this.startPts = '123',
      this.midPts = '123',
      this.endPts = '123',*/
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Dimensions.width135 * 2,
        margin: const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 3.0,
              offset: const Offset(0, 1),
            )
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Container(
              height: Dimensions.height100 + Dimensions.height60,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          imageUrl.isEmpty ? reservationImagePath : imageUrl),
                      fit: BoxFit.cover)),
            ),
            Column(
              children: [
                Padding(
                  padding: leftRightPadding10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        restaurantName,
                        style: TextStyles.title16,
                      ),
                      bookMarkButton!,
                    ],
                  ),
                ),
                Padding(
                  padding: leftRightPadding10,
                  child: Row(
                    children: [
                      TextWidget(
                        '\$\$\$\$ . $restaurantCategory . ',
                        style: TextStyles.regular12,
                      ),
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: primaryColor,
                      ),
                      TextWidget(
                        restaurantRate,
                        style: TextStyles.regular12,
                      ),
                    ],
                  ),
                ),
                const SizedBoxHeight10(),
                timeWithTitle
                    ? Padding(
                        padding: leftRightPadding10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _timeContainerWithTitle(
                              time: startTime,
                              color: strokeColor,
                              //title: startPts,
                            ),
                            _timeContainerWithTitle(
                              time: midTime,
                              color: primaryColor,
                              //title: midPts,
                            ),
                            _timeContainerWithTitle(
                              time: endTime,
                              color: primaryColor,
                              //title: endPts,
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _timeContainerWithTitle({
    required String time,
    required Color color,
    //required String title,
  }) {
    return Column(
      children: [
        Container(
          height: timeContainerHeight,
          width: timeContainerWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: TextWidget(
            time,
            style: TextStyles.title32.copyWith(fontSize: 12, color: whiteColor),
          ),
        ),
        /*TextWidget(
          title,
          style: TextStyles.title11.copyWith(color: primaryColor),
        )*/
      ],
    );
  }
}
