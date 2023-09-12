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

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
/*  late Animation<double> animation;
  late AnimationController controller;*/

/*  String? obtainedIpAddress;
  Future getValidationData() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var savedIp = preferences.getString('ipAddress');
    setState(() {
      obtainedIpAddress = savedIp;
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
/*    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);*/
    Timer(const Duration(seconds: 2), () {
      Get.to(() => LoginScreen());
    });
    /*getValidationData().whenComplete(() async{
      Timer(const Duration(seconds: 3), () {
        Get.to(() => obtainedIpAddress == null ? const ServerSetupScreen() : const LoginScreen());
      });
    });*/
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
              height: MediaQuery.of(context).size.height / 8,
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
