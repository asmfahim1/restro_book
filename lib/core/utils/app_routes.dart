import 'package:get/get.dart';
import 'package:restro_book/modules/auth/login/view/get_started_screen.dart';
import 'package:restro_book/modules/auth/registration/view/registration_screen.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/view_all_area_screen.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/view_all_cuisine_screen.dart';
import 'package:restro_book/modules/home/view/%20reservation_screen/view_all_restaurants.dart';
import 'package:restro_book/modules/home/view/bottom_nav_bar_screen.dart';
import 'package:restro_book/modules/home/view/home_screen.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/booking_confirmation_screen.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/res_details_screen.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/see_all_reviews_screen.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/see_full_menu_screen.dart';
import 'package:restro_book/modules/home/view/restaurant_details_screen/view_full_availability_screen.dart';

import '../../modules/auth/login/view/login_screen.dart';
import '../../modules/auth/login/view/splash_screen.dart';
import '../../modules/saved/view/saved_screen.dart';
import '../../modules/search/view/search_screen.dart';

class AppRoutes {
  static const splashScreen = '/splash_screen';
  static const getStartedScreen = '/get_started_screen';
  static const navBarScreen = '/nav_bar_screen';

  static const loginPage = '/login_page';
  static const registrationPage = '/registration_page';

  static const homePage = '/home_page';
  static const resDetailsScreen = '/restaurant_details_page';
  static const viewFullAvailability = '/view_full_availability_page';
  static const seeFullMenu = '/see_full_menu_page';
  static const seeAllReviews = '/see_all_reviews_page';
  static const viewAllRestaurants = '/view_all_restaurants_page';
  static const viewAllCuisines = '/view_all_cuisines_page';
  static const viewAllArea = '/view_all_area_page';
  static const searchScreen = '/search_page';
  //static const searchDetailsScreen = '/search_details_page';
  static const bookingConfirmScreen = '/booking_confirm_page';
  static const savedScreen = '/saved_page';

  //best way to justify the parameter is actual indicate the specific route
  static String getSplashPage() => splashScreen;
  static String startedScreen() => getStartedScreen;
  static String getNavBarScreen() => navBarScreen;
  static String getLoginScreen() => loginPage;
  static String getRegistrationScreen() => loginPage;
  static String getHomeScreen() => homePage;
  static String getResDetailsScreen(String resName, String resId) =>
      '$resDetailsScreen?resName=$resName&resId=$resId';
  static String getViewFullAvailabilityScreen(String resId, String resName) =>
      '$viewFullAvailability?resId=$resId&resName=$resName';
  static String getSeeFullMenuScreen(String resId, String resName) =>
      '$seeFullMenu?resId=$resId&resName=$resName';
  static String getSeeAllReviewsScreen(String resId, String resName) =>
      '$seeAllReviews?resId=$resId&resName=$resName';
  static String getSearchScreen() => searchScreen;
  // static String getSearchDetailsScreen() => searchDetailsScreen;
  static String getBookingConfirmScreen(
    String resId,
    String resName,
    String partySize,
    DateTime reservationTime,
  ) =>
      '$bookingConfirmScreen?resId=$resId&resName=$resName&partySize=$partySize&reservationTime=$reservationTime';
  static String getViewAllScreen() => viewAllRestaurants;
  static String getViewAllCuisineScreen() => viewAllCuisines;
  static String getViewAllAreaScreen() => viewAllArea;
  static String getSavedScreen() => savedScreen;

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
    GetPage(
        name: viewAllRestaurants,
        transition: Transition.noTransition,
        page: () => const ViewAllRestaurantsScreen()),
    GetPage(
        name: viewAllCuisines,
        transition: Transition.noTransition,
        page: () => const ViewAllCuisineScreen()),
    GetPage(
        name: viewAllArea,
        transition: Transition.noTransition,
        page: () => const ViewAllAreaScreen()),
    GetPage(
        name: searchScreen,
        transition: Transition.noTransition,
        page: () => const SearchScreen()),
/*    GetPage(
        name: searchDetailsScreen,
        transition: Transition.noTransition,
        page: () => const SearchScreenDetails()),*/
    GetPage(
        name: resDetailsScreen,
        transition: Transition.noTransition,
        page: () {
          var resName = Get.parameters['resName']!;
          var resId = Get.parameters['resId']!;
          return RestaurantDetailsScreen(
            resName: resName,
            resId: resId,
          );
        }),
    GetPage(
        name: viewFullAvailability,
        transition: Transition.noTransition,
        page: () {
          var resName = Get.parameters['resName']!;
          var resId = Get.parameters['resId']!;
          return ViewFullAvailabilityScreen(
            resName: resName,
            resId: resId,
          );
        }),
    GetPage(
        name: seeFullMenu,
        transition: Transition.noTransition,
        page: () {
          var resName = Get.parameters['resName']!;
          var resId = Get.parameters['resId']!;
          return SeeFullMenuScreen(
            resName: resName,
            resId: resId,
          );
        }),
    GetPage(
        name: seeAllReviews,
        transition: Transition.noTransition,
        page: () {
          var resName = Get.parameters['resName']!;
          var resId = Get.parameters['resId']!;
          return SeeAllReviewsScreen(
            resName: resName,
            resId: resId,
          );
        }),
    GetPage(
        name: bookingConfirmScreen,
        transition: Transition.noTransition,
        page: () {
          var resName = Get.parameters['resName']!;
          var resId = Get.parameters['resId']!;
          var partySize = Get.parameters['partySize']!;
          var reservationTime = Get.parameters['reservationTime']!;
          return BookingConfirmScreen(
            resName: resName,
            resId: resId,
            partySize: partySize,
            reservationTime: DateTime.parse(reservationTime),
          );
        }),
    GetPage(
        name: savedScreen,
        transition: Transition.noTransition,
        page: () => SavedScreen()),
  ];
}
