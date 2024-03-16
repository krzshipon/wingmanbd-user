import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'otp_title'.tr,
          ),
          verticalSpaceLarge,
          Obx(
            () => CSInputField(
              controller: controller.tcOtpController,
              placeholder: 'otp_label_enter_otp'.tr,
              inputType: TextInputType.number,
              errorText: controller.otpStatus.value,
              maxLines: 1,
            ),
          ),
          verticalSpaceRegular,
          Obx(
            () => CSButton(
              title: "otp_button_continue".tr,
              onTap: () => controller.verifyOtp(),
              isDisabled: controller.isValidOtp.isFalse,
            ),
          ),
          verticalSpaceLarge,
          Align(
            alignment: Alignment.center,
            child: Obx(
              () => CSTupleText(
                text1: controller.otpResendText1.value,
                text2: controller.otpResendText2.value,
                onTap: () => controller.resendOtp(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
