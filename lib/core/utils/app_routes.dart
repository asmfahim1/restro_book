import 'package:get/get.dart';
import 'package:restro_book/modules/auth/login/view/get_started_screen.dart';
import 'package:restro_book/modules/auth/registration/view/registration_screen.dart';
import 'package:restro_book/modules/home/view/bottom_nav_bar_screen.dart';
import 'package:restro_book/modules/home/view/home_screen.dart';

import '../../modules/auth/login/view/login_screen.dart';
import '../../modules/auth/login/view/splash_screen.dart';

class AppRoutes {
  static const splashScreen = '/splash_screen';
  static const getStartedScreen = '/get_started_screen';
  static const navBarScreen = '/nav_bar_screen';

  //Auth
  static const loginPage = '/login_page';
  static const registrationPage = '/registration_page';

  static const homePage = '/home_page';

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        transition: Transition.cupertino,
        page: () => const SplashScreen()),
    GetPage(
        name: getStartedScreen,
        transition: Transition.cupertino,
        page: () => const GetStartedScreen()),
    GetPage(
        name: navBarScreen,
        transition: Transition.cupertino,
        page: () => const BottomNavigationScreen()),
    GetPage(
        name: loginPage,
        transition: Transition.noTransition,
        page: () => const LoginScreen()),
    GetPage(
        name: registrationPage,
        transition: Transition.noTransition,
        page: () => const RegistrationScreen()),
    GetPage(
        name: homePage,
        transition: Transition.noTransition,
        page: () => const HomeScreen()),
  ];
}
