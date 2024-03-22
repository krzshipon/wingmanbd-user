import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                CSText("donation_request_item_label_type".tr),
                Row(
                  children: [
                    CsCheckbox(
                      true,
                      (value) {},
                      title: "BLOOD",
                    ),
                    CsCheckbox(
                      false,
                      (value) {},
                      title: "PLATELETS",
                    ),
                  ],
                ),
                CSDropDown(
                  ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
                  header: "donation_request_item_label_group".tr,
                  onValueChange: (p0) => {},
                  value: 'A+',
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: TextEditingController(),
                    placeholder: 'donation_request_item_label_quantity'.tr,
                    inputType: TextInputType.number,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: TextEditingController(),
                    placeholder: 'donation_request_item_label_name'.tr,
                    inputType: TextInputType.name,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: TextEditingController(),
                    placeholder: 'donation_request_item_label_contact'.tr,
                    inputType: TextInputType.phone,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: TextEditingController(),
                    placeholder: 'donation_request_item_label_problem'.tr,
                    inputType: TextInputType.text,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: TextEditingController(),
                    placeholder: 'donation_request_item_label_hospital'.tr,
                    inputType: TextInputType.text,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: TextEditingController(),
                    placeholder: 'donation_request_item_label_bed'.tr,
                    inputType: TextInputType.text,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: TextEditingController(text: "23 March"),
                    placeholder: 'Date for Donation:'.tr,
                    inputType: TextInputType.datetime,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                verticalSpaceRegular,
                Obx(
                  () => CSInputField(
                    controller: TextEditingController(text: '12:00pm'),
                    placeholder: 'donation_request_item_label_time'.tr,
                    inputType: TextInputType.datetime,
                    errorText: controller.errorAmount.isNotEmpty
                        ? controller.errorAmount.value
                        : null,
                  ),
                ),
                CsCheckbox(
                  true,
                  (value) {},
                  title: 'donation_request_item_label_is_critical'.tr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}