import 'package:get/get_connect/http/src/response/response.dart';
import 'package:restro_book/core/utils/const_key.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationRepo {
  late final ApiClient apiClient;
  late final SharedPreferences sharedPreferences;

  RegistrationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(Map<String, dynamic> registrationBody) async {
    print('------------------$registrationBody');
    return await apiClient.postData(Urls.registerUrl, registrationBody);
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    await sharedPreferences.setString(AppConstantKeys.TOKEN.key, token);
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstantKeys.TOKEN.key);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstantKeys.TOKEN.key) ?? "None";
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstantKeys.TOKEN.key);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
