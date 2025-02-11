import 'package:farm_fresh/firebase_options.dart';
import 'package:farm_fresh/pages/home/home_page.dart';
import 'package:farm_fresh/pages/language_setting_page.dart';
import 'package:farm_fresh/theme/app_color.dart';
import 'package:farm_fresh/utils/language.dart';
import 'package:farm_fresh/utils/loader_controller.dart';
import 'package:farm_fresh/utils/shared_preference.dart';
import 'package:farm_fresh/utils/sizeutils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/auth_controller.dart';
import 'controller/home_controller.dart';
import 'controller/profile_controller.dart';
import 'generated/assets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    loadHighResImagePre(context);
    SizeConfig().init(context);
    String? savedLocale = PreferenceManager.getLocale();
    Locale startLocale = Locale(savedLocale ?? 'en');
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        color: appColor,
        translations: Languages(),
        locale: startLocale,
        fallbackLocale: Locale("en"),
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: appColor,
          hintColor: appBackgroundColor,
        ),
        initialBinding: BaseBindings(),
        home:
            PreferenceManager.getIsLogIn() ? HomePage() : LanguageSettingPage(),
      ),
    );
  }

  void loadHighResImagePre(BuildContext context) {
    precacheImage(const AssetImage(Assets.appIcon), context);
    precacheImage(const AssetImage(Assets.languageSettingIcon), context);
    precacheImage(const AssetImage(Assets.messageOtpIcon), context);
    precacheImage(const AssetImage(Assets.registrationIcon), context);
  }
}

class BaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoaderController(), permanent: true);
    Get.put(AuthController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    // Get.lazyPut(() => ProfileController(), fenix: true);
    Get.put(ProfileController(), permanent: true);
  }
}
