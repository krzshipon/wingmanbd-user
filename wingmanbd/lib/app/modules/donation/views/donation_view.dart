import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/asset_keys.dart';
import '../controllers/donation_controller.dart';

class DonationView extends GetView<DonationController> {
  const DonationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      floatingActionButton: Obx(
        () => CSIconButton(
          icon:
              controller.editMode.value ? Icons.check_sharp : Icons.edit_sharp,
          onTap: () => controller.saveDonationData(),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'donation_title'.tr,
          ),
          verticalSpaceLarge,
          Expanded(
            child: ListView(
              children: [
                _DonationSummary(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _DonationSummary() => CSCard(
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 50,
                      foregroundColor: Get.theme.colorScheme.secondary,
                      backgroundColor: Get.theme.colorScheme.secondary,
                      backgroundImage: const AssetImage(kProfileImage),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: LottieBuilder.asset(
                  kaConnectionAnim,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 50,
                      foregroundColor: Get.theme.colorScheme.secondary,
                      backgroundColor: Get.theme.colorScheme.secondary,
                      backgroundImage: const AssetImage(kProfileImage),
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceRegular,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CsIcon(Icons.water_drop_sharp),
              CSText('O+'),
              horizontalSpaceSmall,
              CsIcon(Icons.bloodtype_sharp),
              CSText('BLOOD'),
              horizontalSpaceSmall,
              CsIcon(Icons.medical_services_sharp),
              CSText('1 bag'),
            ],
          ),
        ],
      );
}
