enum AppConstantKeys {
  USER_ID,
  TOKEN,
  LANGUAGE,
  YYYY_MM_DD,
  DD_MM_YYYY,
  DD_MM_YYYY_SLASH,
  D_MMM_Y_HM,
  D_MMM_Y,
  D_MM_Y,
  YYYY_MM,
  MMM,
  MMMM,
  MMMM_Y,
  APPLICATION_JSON,
  BEARER,
  MULTIPART_FORM_DATA,
  IS_SWITCHED,
  DEVICE_ID,
  DEVICE_OS,
  USER_AGENT,
  APP_VERSION,
  BUILD_NUMBER,
  ANDROID,
  IOS,
  IPN_URL,
  STORE_ID,
  STORE_PASSWORD,
  MOBILE,
  EMAIL,
  PUSH_ID,
  EN,
  BN,
  FONTFAMILY,
}

extension AppConstantExtention on AppConstantKeys {
  String get key {
    switch (this) {
      case AppConstantKeys.USER_ID:
        return "USER_ID";
      case AppConstantKeys.TOKEN:
        return "TOKEN";
      case AppConstantKeys.LANGUAGE:
        return "language";
      case AppConstantKeys.DD_MM_YYYY:
        return "dd-MM-yyyy";
      case AppConstantKeys.DD_MM_YYYY_SLASH:
        return "dd/MM/yyyy hh:mm a";
      case AppConstantKeys.D_MMM_Y_HM:
        return "d MMMM y hh:mm a";
      case AppConstantKeys.D_MM_Y:
        return "d MMM y";
      case AppConstantKeys.D_MMM_Y:
        return "d MMMM y";
      case AppConstantKeys.MMMM_Y:
        return "MMMM y";
      case AppConstantKeys.MMM:
        return "MMM";
      case AppConstantKeys.MMM:
        return "MMMM";
      case AppConstantKeys.YYYY_MM:
        return 'yyyy-MM';
      case AppConstantKeys.YYYY_MM_DD:
        return "yyyy-MM-dd";
      case AppConstantKeys.APPLICATION_JSON:
        return "application/json";
      case AppConstantKeys.BEARER:
        return "Bearer";
      case AppConstantKeys.MULTIPART_FORM_DATA:
        return "multipart/form-data";
      case AppConstantKeys.IS_SWITCHED:
        return "IS_SWITCHED";
      case AppConstantKeys.USER_AGENT:
        return "user-agent";
      case AppConstantKeys.BUILD_NUMBER:
        return "build";
      case AppConstantKeys.DEVICE_ID:
        return "device-id";
      case AppConstantKeys.APP_VERSION:
        return "app-version";
      case AppConstantKeys.DEVICE_OS:
        return "device-os";
      case AppConstantKeys.PUSH_ID:
        return "push-id";
      case AppConstantKeys.ANDROID:
        return "android";
      case AppConstantKeys.IOS:
        return "ios";
      case AppConstantKeys.IPN_URL:
        return "ipn_url";
      case AppConstantKeys.STORE_ID:
        return "store_id";
      case AppConstantKeys.STORE_PASSWORD:
        return "store_password";
      case AppConstantKeys.MOBILE:
        return "mobile";
      case AppConstantKeys.EMAIL:
        return "email";
      case AppConstantKeys.EN:
        return 'en';
      case AppConstantKeys.BN:
        return 'bn';
      case AppConstantKeys.FONTFAMILY:
        return 'Arboria';

      default:
        return "";
    }
  }
}
