import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/license_controller.dart';
import 'license_card_view.dart';

class LicenseView extends GetView<LicenseController> {
  const LicenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'license'.tr,
          ),
          verticalSpaceSmall,
          Expanded(
            child: LiveList.options(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: animationItemBuilder(
                  ((index) => LicenseCardView(controller.license[index]))),
              itemCount: controller.license.length,
              options: kAnimationOptions,
            ),
          ),
        ],
      ),
    );
  }
}
