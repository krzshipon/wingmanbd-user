import 'package:package_info_plus/package_info_plus.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:wingmanbd/app/extensions/string_ext.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class SettingController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  var currentLang = Get.locale?.languageCode.getLanguageFromCode().obs;

  final appVersion = ''.obs;

  @override
  void onReady() {
    getAppVersion();
    super.onReady();
  }

  void gotoProfile() {
    if (_authService.currentUser.value == null) {
      Get.toNamed(Routes.AUTH);
    } else {
      Get.toNamed(Routes.PROFILE);
    }
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    appVersion.value = version;
  }

  void gotoLicense() {}

  openFeedbackView() {}

  void gotoLanguageSetting() {
    Get.toNamed(Routes.LANGUAGE);
  }
}
