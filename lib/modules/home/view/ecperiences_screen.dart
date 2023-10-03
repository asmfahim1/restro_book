import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/colors.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          _locationTimeWidget(),
          _featuredWidget()
        ],
      ),
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
    Size size = MediaQuery.of(context).size;
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
}
