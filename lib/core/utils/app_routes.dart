import 'package:get/get.dart';
import 'package:restro_book/modules/auth/registration/view/registration_screen.dart';
import 'package:restro_book/modules/home/view/home_screen.dart';

import '../../modules/auth/login/view/login_screen.dart';
import '../../modules/auth/login/view/splash_screen.dart';

class AppRoutes {
  static const splashScreen = '/splash_screen';

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
        name: loginPage,
        transition: Transition.noTransition,
        page: () => const LoginScreen()),
    GetPage(
        name: registrationPage,
        transition: Transition.noTransition,
        page: () => const RegistrationScreen()),
    GetPage(
        name: loginPage,
        transition: Transition.noTransition,
        page: () => const HomeScreen()),
  ];
}
