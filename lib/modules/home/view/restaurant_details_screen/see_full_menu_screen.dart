import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/home/controller/reservation_controller.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../../../../../../core/utils/exports.dart';

class SeeFullMenuScreen extends StatelessWidget {
  final String resId;
  final String resName;
  SeeFullMenuScreen({Key? key, required this.resId, required this.resName})
      : super(key: key);

  final reservationController = Get.find<ReservationController>();

  final String foodMenuUrl =
      "www.lindensnyc.com/?gad_source=1&gclid=CjwKCAiA0syqBhBxEiwAeNx9N-7W2NB1TJj87znUl-fdk7p58E46UQ0k0dNIHlr50cMUOsn-2C9JihoCX4kQAvD_BwE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          resName,
          style: TextStyles.title20.copyWith(color: whiteColor),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Dimensions.height100,
        ),
        GestureDetector(
          onTap: () {
            launcher.launchUrl(
              Uri.parse('https://flutter.dev'),
              mode: launcher.LaunchMode.externalApplication,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.list_alt_outlined,
                size: Dimensions.iconSize30,
                color: primaryColor,
              ),
              TextWidget(
                'View menu on restaurant\'s website',
                style: TextStyles.regular14.copyWith(color: primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

/*  Future<void> _openMenuUrl(String mainUrl) async {
    final url = Uri.parse("https://flutter.dev");
    if(await launchUrl(url, mode: launcher.Launc)){
      throw "Can not launch url";
    }
  }*/
}
