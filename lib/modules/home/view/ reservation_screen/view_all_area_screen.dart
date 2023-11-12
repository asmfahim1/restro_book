import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class ViewAllAreaScreen extends StatelessWidget {
  const ViewAllAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: whiteColor,
            )),
        title: TextWidget(
          'Explore the area',
          style: TextStyles.title20.copyWith(color: whiteColor),
        ),
      ),
      body: _listOfArea(),
    );
  }

  Widget _listOfArea() {
    return Container(
      padding: allPadding15,
      child: GridView.builder(
        itemCount: exploreAres.length, // Replace with your actual item count
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 2.5,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: strokeColor, // Replace with your desired stroke width
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: leftRightPadding15,
            child: TextWidget(
              exploreAres[index], // Replace with your actual name
              style: TextStyles.title16.copyWith(
                fontSize: 14.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
