import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/home/view/widget/experience_featured_widget.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/text_widget.dart';

class ExperiencesBarScreen extends StatefulWidget {
  const ExperiencesBarScreen({Key? key}) : super(key: key);

  @override
  State<ExperiencesBarScreen> createState() => _ExperiencesBarScreenState();
}

class _ExperiencesBarScreenState extends State<ExperiencesBarScreen> {
  @override
  Widget build(BuildContext context) {
    print('Experience screen build');
    return Column(
      children: [
        _locationTimeWidget(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _featuredWidget(),
                _upcomingTitle(),
                _upcomingListWidget(),
                _viewAllBtn(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _locationTimeWidget() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: size.height / 22,
              width: size.width / 8.6,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.person_outline_rounded,
                    size: 14,
                  ),
                  TextWidget(
                    '2',
                    style: TextStyles.title32.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: size.height / 22,
              width: size.width / 2.8,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 14,
                  ),
                  TextWidget(
                    overflow: TextOverflow.ellipsis,
                    'Matuail Katherpool',
                    style: TextStyles.title32.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredWidget() {
    return ExperieneFeaturedWidget(
      titleOfTheList: 'Featured',
      onTap: () {},
      listItemLength: 10,
      restaurantName: 'Chef\'s Counter Tasting',
      restaurantCategory: '3rd Cuisin',
      price: '\$ 185.00',
      resLocation: 'Bernal Heights, San Fransisco',
    );
  }

  Widget _upcomingTitle(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 16,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerLeft,
      child: TextWidget(
        'Upcoming',
        style: TextStyles.title20,
      ),
    );
  }

  Widget _upcomingListWidget(){
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (_, index) {
          return Container(
            height: size.height / 5,
            margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: strokeColor)
                )
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    width: size.width / 1.6,
                    child: Column(
                      children: [
                        TextWidget('Petite Omakase for Tuesday through Thursday', style: TextStyles.title16,),
                        Row(
                          children: [
                            TextWidget(
                              'KUSAKABE',
                              style: TextStyles.regular12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                  color: strokeColor,
                                  shape: BoxShape.circle
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextWidget(
                              '\$ 148.00',
                              style: TextStyles.regular12,
                            ),
                          ],
                        ),
                        TextWidget(
                          'Financial District / Embarcadero, San Fransisco',
                          style: TextStyles.regular12,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: size.height / 12,
                        width: 100,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 3.0,
                              offset: const Offset(0, 1),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: size.height / 28,
                              color: primaryColor,
                              alignment: Alignment.center,
                              child: TextWidget('Oct', style: TextStyles.title16.copyWith(color: whiteColor),),
                            ),
                            Expanded(
                                child: Container(
                                  color: whiteColor,
                                  alignment: Alignment.center,
                                  child: TextWidget('3', style: TextStyles.title20,),
                                ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _viewAllBtn(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 12,
      width: size.width,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: strokeColor,
          width: 1.2
        )
      ),
      child: TextWidget('View all', style: TextStyles.title16,),
    );
  }
}
