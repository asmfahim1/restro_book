import 'package:get/get.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/modules/auth/login/controller/login_controller.dart';
import 'package:restro_book/modules/auth/login/repo/login_repo.dart';
import 'package:restro_book/modules/auth/registration/controller/registration_controller.dart';
import 'package:restro_book/modules/auth/registration/repo/registration_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  ///shared prefs
  Get.lazyPut(() => sharedPreferences, fenix: true);

  //api client
  Get.lazyPut(
      () => ApiClient(appBaseUrl: Urls.baseUrl, sharedPreferences: Get.find()),
      fenix: true);

  ///Repo
  Get.lazyPut(
      () => LoginRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
      fenix: true);
  Get.lazyPut(
      () => RegistrationRepo(
          apiClient: Get.find(), sharedPreferences: Get.find()),
      fenix: true);

  ///Controller
  //Auth
  Get.lazyPut(() => LoginController(loginRepo: Get.find<LoginRepo>()),
      fenix: true);
  Get.lazyPut(
      () => RegistrationController(
          registrationRepo: Get.find<RegistrationRepo>()),
      fenix: true);
}
