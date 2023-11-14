import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class ViewAllCuisineScreen extends StatelessWidget {
  const ViewAllCuisineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
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
            'Browse by cuisine',
            style: TextStyles.title20.copyWith(color: whiteColor),
          ),
        ),
        body: _listOfCuisines(),
      ),
    );
  }

  Widget _listOfCuisines() {
    return Container(
      padding: leftRightPadding15,
      child: GridView.builder(
        itemCount: restaurantCousins.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: .7),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                // Image with 70% height
                const CircleAvatar(
                  radius: 45,
                  backgroundImage:
                      AssetImage('assets/images/recently_viewed_4.jpg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  restaurantCousins[index],
                  overflow:
                      TextOverflow.ellipsis, // Replace with your actual name
                  style: TextStyles.title16.copyWith(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/*Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                // Image with 70% height
                Container(
                  height: Dimensions.height100 * 1.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/recently_viewed_4.jpg'), // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Text widget for item title
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: leftRightPadding15,
                    child: TextWidget(
                      restaurantCousins[index], // Replace with your actual name
                      style: TextStyles.title16.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )*/
