import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/modules/auth/login/view/splash_screen.dart';
import 'core/utils/app_version.dart';
import 'core/utils/pref_helper.dart';
//localization
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'modules/auth/login/view/login_screen.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

/// Make sure you always init shared pref first. It has token and token is need
/// to make API call
initServices() async {
  await PrefHelper.init();
  await AppVersion.getVersion();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return GetMaterialApp(
      title: 'restro_book',
      debugShowCheckedModeBanner: false,
      //localization
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: (PrefHelper.getLanguage() == 1)
          ? const Locale('en', 'US')
          : const Locale('bn', 'BD'),
      theme: ThemeData(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: primaryColor,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: secondaryColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
