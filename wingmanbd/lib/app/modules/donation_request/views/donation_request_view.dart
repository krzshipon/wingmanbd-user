import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/donation_request_controller.dart';

class DonationRequestView extends GetView<DonationRequestController> {
  const DonationRequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      floatingActionButton: CSIconButton(
        icon: Icons.check_sharp,
        onTap: () => controller.saveDonationData(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'donation_request_title'.tr,
          ),
          verticalSpaceLarge,
          Expanded(
            child: ListView(
              children: [
                Obx(
                  () => CSInputField(
                    controller: controller.tcAmount,
                    placeholder: 'donation_request_label_amount'.tr,
                    inputType: TextInputType.number,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: controller.tcAmount,
                    placeholder: 'donation_request_label_amount'.tr,
                    inputType: TextInputType.number,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: controller.tcAmount,
                    placeholder: 'donation_request_label_amount'.tr,
                    inputType: TextInputType.number,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: controller.tcAmount,
                    placeholder: 'donation_request_label_amount'.tr,
                    inputType: TextInputType.number,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: controller.tcAmount,
                    placeholder: 'donation_request_label_amount'.tr,
                    inputType: TextInputType.number,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
