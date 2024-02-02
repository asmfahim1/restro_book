class Urls {
  ///base url
  static String get baseUrl => 'http://restapi.adequateshop.com/api';

  static String loginUrl = '/authaccount/login';
  static String registerUrl = '/authaccount/registration';
  static String signUpVerificationUrl = '';
  static String resendVerificationCode = '';
  static String verifyPasswordUrl = '';
  static String resendCodeUrl = '';

  ///Shared Preferences
  static const String storedToken = 'token';
  static const String storedUserType = 'user_type';

  //Password
  static const String storedPassword = 'password';
}
