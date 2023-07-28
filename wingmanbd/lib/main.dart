import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'app/data/asset_keys.dart';
import 'app/routes/app_pages.dart';
import 'app/services/auth_service.dart';
import 'app/services/db_service.dart';
import 'app/util/app_constants.dart';
import 'app/extensions/string_ext.dart';
import 'app/util/app_theme.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Init DB
  await GetStorage.init();

  //Initial Ui Config
  await setupUiConfig();

  ///AWAIT SERVICES INITIALIZATION.
  await initServices();

  //App language
  var appLangCode = GetStorage().read<String>(kCurrentLangCode);
  var locale = appLangCode?.getLocaleFromCode() ?? kDefaultLocale;

  runApp(
    GetMaterialApp(
      title: 'app_name'.tr,
      translationsKeys: AppTranslation.translations,
      locale: locale,
      fallbackLocale: kFallbackLocale,
      initialRoute: Get.find<AuthService>().currentUser.value == null
          ? AppPages.INITIAL
          : Routes.HOME,
      getPages: AppPages.routes,
      theme: appThemeL,
      darkTheme: appDarkTheme,
      enableLog: true,
      //initialBinding: BindingsBuilder(() => initServices()),
      debugShowCheckedModeBanner: false,
    ),
  );
}

setupUiConfig() {
  AppConfig.loaderScale = 1.7;
}

initServices() async {
  ///Initializing.. realm service
  final realmConfig =
      json.decode(await rootBundle.loadString(kRealmConfigFile));
  String appId = realmConfig['appId'];
  Uri baseUrl = Uri.parse(realmConfig['baseUrl']);
  await Get.putAsync(() => AuthService().init(appId, baseUrl));

  ///Initialize DB Service
  Get.put(DbService());

  ///Put Other service here...
}
