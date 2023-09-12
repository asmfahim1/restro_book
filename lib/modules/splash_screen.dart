import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_book/modules/auth/login/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
/*  late Animation<double> animation;
  late AnimationController controller;*/

  @override
  void initState() {
    super.initState();
/*    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);*/
    Timer(const Duration(seconds: 3), () {
      Get.to(LoginScreen.new);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/loading.gif',
              width: MediaQuery.of(context).size.width / 1.6,
            ),
          )
        ],
      ),
    );
  }
}