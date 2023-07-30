import 'package:package_info_plus/package_info_plus.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:wingmanbd/app/extensions/string_ext.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';
import '../../feedback/controllers/feedback_controller.dart';
import '../../feedback/views/feedback_view.dart';

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

  void gotoLicense() {
    Get.toNamed(Routes.LICENSE);
  }

  openFeedbackView() {
    Get.lazyPut<FeedbackController>(
      () => FeedbackController(),
    );
    Get.bottomSheet(FeedbackView());
  }

  void gotoLanguageSetting() {
    Get.toNamed(Routes.LANGUAGE);
  }

  void gotoDonationHistory() {
    Get.toNamed(Routes.DONATION_HISTORY);
  }

  void gotoDonationRequestHistory() {
    Get.toNamed(Routes.DONATION_HISTORY);
  }
}
