import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/asset_path.dart';
import 'package:restro_book/core/widgets/exports.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width / 1.5,
              child: Image.asset(appIconImage),
            ),
            TextWidget('Restro_book')
          ],
        ),
      ),
    );
  }
}
