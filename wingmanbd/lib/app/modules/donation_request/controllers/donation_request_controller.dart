import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class DonationRequestController extends GetxController {
  final tcAmount = TextEditingController();
  final errorAmount = ''.obs;

  // final tcAmount = TextEditingController();
  // final errorAmount = ''.obs;

  // final tcAmount = TextEditingController();
  // final errorAmount = ''.obs;

  // final tcAmount = TextEditingController();
  // final errorAmount = ''.obs;

  // final tcAmount = TextEditingController();
  // final errorAmount = ''.obs;

  // final tcAmount = TextEditingController();
  // final errorAmount = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  saveDonationData() {
    Get.showDialog(
      'Request submitted. Please wait for the donor.',
      onConfirm: () => Get.back(),
      dialogType: DialogType.general,
    );
  }
}
