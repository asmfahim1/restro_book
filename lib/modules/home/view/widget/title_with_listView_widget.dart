import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class TitleWithListViewWidget extends StatelessWidget {
  final double height;
  final String titleOfTheList;
  final bool isViewNeeded;
  final VoidCallback onTap;
  final int listItemLength;
  final String restaurantName;
  final String restaurantCategory;
  final String restaurantRate;
  final bool timeWithTitle;
  final double timeContainerHeight;
  final double timeContainerWidth;
  final String startTime;
  final String midTime;
  final String endTime;
  final String startPts;
  final String midPts;
  final String endPts;
  const TitleWithListViewWidget(
      {required this.height,
      required this.titleOfTheList,
      this.isViewNeeded = true,
      required this.onTap,
      required this.listItemLength,
      required this.restaurantName,
      required this.restaurantCategory,
      required this.restaurantRate,
      this.timeWithTitle = true,
      required this.timeContainerHeight,
      required this.timeContainerWidth,
      this.startTime = '00:00 AM',
      this.midTime = '00:00 AM',
      this.endTime = '00:00 AM',
      this.startPts = '123',
      this.midPts = '123',
      this.endPts = '123',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: leftRightPadding15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    titleOfTheList,
                    style: TextStyles.title16,
                  ),
                  isViewNeeded
                      ? TextWidget(
                          'VIEW ALL',
                          style:
                              TextStyles.title16.copyWith(color: primaryColor),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                  itemCount: listItemLength,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      width: size.width / 1.4,
                      margin:
                          const EdgeInsets.only(right: 20, top: 10, bottom: 10),
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
                            height: size.height / 5.5,
                            width: size.width,
                            color: darkGrayColor,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      restaurantName,
                                      style: TextStyles.title16,
                                    ),
                                    const Icon(
                                      Icons.bookmark_border,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
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
                              const SizedBoxHeight20(),
                              timeWithTitle
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _timeContainerWithTitle(
                                          time: startTime,
                                          color: strokeColor,
                                          title: startPts,
                                        ),
                                        _timeContainerWithTitle(
                                          time: midTime,
                                          color: primaryColor,
                                          title: midPts,
                                        ),
                                        _timeContainerWithTitle(
                                          time: endTime,
                                          color: primaryColor,
                                          title: endPts,
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeContainerWithTitle({
    required String time,
    required Color color,
    required String title,
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
            style: TextStyles.title32.copyWith(fontSize: 14, color: whiteColor),
          ),
        ),
        TextWidget(
          title,
          style: TextStyles.title11.copyWith(color: primaryColor),
        )
      ],
    );
  }
}
