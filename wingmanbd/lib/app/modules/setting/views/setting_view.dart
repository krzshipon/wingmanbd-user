import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: kpHorizontalPadding),
        children: [
          verticalSpaceLarge,
          Padding(
            padding:
                const EdgeInsets.only(left: kmCardMarginS + kmTextExtraMargin),
            child: CSText.title('setting_title'.tr),
          ),
          verticalSpaceRegular,
          CsSettingItem(
            onTap: () {
              controller.gotoProfile();
            },
            title: 'setting_item_profile'.tr,
            iconData: Icons.account_circle_sharp,
          ),
          CsSettingItem(
            onTap: () {
              controller.gotoDonationHistory();
            },
            title: 'setting_item_donation_history'.tr,
            iconData: Icons.history_toggle_off_sharp,
          ),
          CsSettingItem(
            onTap: () {
              controller.gotoDonationRequestHistory();
            },
            title: 'setting_item_donation_request_history'.tr,
            iconData: Icons.history_toggle_off_sharp,
          ),
          CsSettingItem(
            onTap: () {
              controller.gotoLicense();
            },
            title: 'setting_item_license'.tr,
            iconData: Icons.book_sharp,
          ),
          CsSettingItem(
            onTap: () => controller.openFeedbackView(),
            title: 'setting_item_feedback'.tr,
            iconData: Icons.feedback_sharp,
          ),
          verticalSpaceMedium,
          CsSettingItem(
            onTap: () {
              controller.gotoLanguageSetting();
            },
            header: 'setting_item_lang'.tr,
            title: controller.currentLang?.value?.name ??
                Get.locale?.languageCode ??
                "English",
            iconData: Icons.language_sharp,
          ),
          verticalSpaceMedium,
          Obx(
            () => CsSettingItem(
              header: 'setting_item_version'.tr,
              title: controller.appVersion.value,
              iconData:
                  GetPlatform.isIOS ? Icons.apple_sharp : Icons.android_sharp,
              showTrailing: false,
            ),
          ),
        ],
      ),
    );
  }
}
