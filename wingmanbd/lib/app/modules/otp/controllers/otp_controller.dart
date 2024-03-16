import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:wingmanbd/app/modules/auth/controllers/auth_controller.dart';
import 'package:wingmanbd/app/routes/app_pages.dart';
import 'package:wingmanbd/app/util/app_constants.dart';

import '../providers/otp_response_provider.dart';

class OtpController extends GetxController {
  final GetStorage _box = GetStorage();
  final OtpResponseProvider _otpResponseProvider = OtpResponseProvider();
  final _authController = Get.find<AuthController>();

  //Controllers
  final tcOtpController = TextEditingController();
  final isValidOtp = false.obs;

  final _otp = ''.obs;

  final _otpRemainingSeconds = 0.obs;
  final _otpTryCount = 0.obs;

  final otpStatus = ''.obs;
  final otpResendText1 = ''.tr.obs;
  final otpResendText2 = ''.obs;

  //Otp Timer
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    printInfo(info: "onInit ▶▶ syncOtpStatus");
    syncOtpStatus();
  }

  @override
  void onReady() {
    super.onReady();
    printInfo(info: "onInit ▶▶ sendOtp");
    sendOtp();
    tcOtpController.addListener(() {
      isValidOtp.value = tcOtpController.text.length == 4;
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> sendOtp() async {
    printInfo(
        info:
            "sendOtp ▶▶ _otpTryCount: ${_otpTryCount.value} _otpRemainingSeconds: ${_otpRemainingSeconds.value}");
    if (_otpTryCount < 3) {
      if (_otpRemainingSeconds <= 0) {
        try {
          Get.showLoader();
          // Call the getOtpResponse method from the provider
          printInfo(info: "sendOtp ▶ getOtpResponse ⫸");
          _otp.value = generateOTP();
          final response = await _otpResponseProvider.getOtpResponse(
            'otp_message'.trParams(
              {
                'code': _otp.value,
              },
            ),
            _authController.tcUserMobile.text,
          );
          printInfo(
              info: "sendOtp ▶ getOtpResponse ⫷ ${response?.responseCode}");

          //Hide loader first
          Get.hideLoader();

          // Handle the response as needed
          if (response != null) {
            // Do something with the response
            printInfo(info: 'OTP response received: ${response.responseCode}');
            if (response.responseCode == kOtpResponseCodeSuccess) {
              printInfo(info: "sendOtp ▶ getOtpResponse ▶ OK[✔] ▶ OTP Sent");
              _otpTryCount.value++;
              _otpRemainingSeconds.value = kOtpRetryIntervalSeconds;
              _box.write(kLastSentOtpKey, _otp.value);
              _box.write(kOtpTryCountKey, _otpTryCount.value);
              _box.write(
                  kLastOtpSentTimeKey, DateTime.now().millisecondsSinceEpoch);
              otpStatus.value = "otp_status_sent".trParams({
                'mobile': _authController.tcUserMobile.text,
              });
              _startTimer();
            } else if (response.responseCode == kOtpResponseCodeInvalidNumber) {
              printError(
                  info:
                      "sendOtp ▶ getOtpResponse ▶ Failed to send OTP[✘]: Invalid Number");
              otpStatus.value = "otp_error_invalid_number".trParams({
                'mobile': _authController.tcUserMobile.text,
              });
              _timer?.cancel();
              Get.showDialog(
                'otp_error_invalid_number'.trParams({
                  'mobile': _authController.tcUserMobile.text,
                }),
                dialogType: DialogType.error,
                onConfirm: () => Get.back(),
              );
            } else {
              // Handle other codes
              printError(
                  info:
                      "sendOtp ▶ getOtpResponse ▶ Failed to send OTP[✘]: Other Error Codes");
              otpStatus.value = "otp_error_unknown".tr;
              _timer?.cancel();
              Get.showDialog(
                'otp_error_unknown'.tr,
                dialogType: DialogType.error,
                onConfirm: () => Get.back(),
              );
            }
          } else {
            // Handle null response
            printError(
                info:
                    "sendOtp ▶ getOtpResponse ▶ Failed to send OTP[✘]: Response null");
            otpStatus.value = "otp_error_unknown".tr;
            _timer?.cancel();
            Get.showDialog(
              'otp_error_unknown'.tr,
              dialogType: DialogType.error,
              onConfirm: () => Get.back(),
            );
          }
        } catch (error) {
          // Handle errors
          printError(
              info: "sendOtp ▶ getOtpResponse ▶ Failed to send OTP[✘]: $error");
          Get.hideLoader();
          otpStatus.value = "otp_error_unknown".tr;
          _timer?.cancel();
          Get.showDialog(
            'otp_error_unknown'.tr,
            dialogType: DialogType.error,
            onConfirm: () => Get.back(),
          );
        }
      } else {
        printInfo(info: "sendOtp ▶ Already sent: _startTimer()");
        _startTimer();
      }
    } else {
      int? lastOtpSentTimeStamp = _box.read(kLastOtpSentTimeKey);
      if (lastOtpSentTimeStamp != null) {
        DateTime lastSentTime =
            DateTime.fromMillisecondsSinceEpoch(lastOtpSentTimeStamp);
        Duration timeDiff = DateTime.now().difference(lastSentTime);
        _otpRemainingSeconds.value =
            max(0, kOtpResetIntervalSeconds - timeDiff.inSeconds);
        if (_otpRemainingSeconds.value <= 0) {
          printInfo(
              info:
                  "sendOtp ▶ Remaining time 0  ▶ reset all & send otp again...");
          //reset all
          _otpTryCount.value = 0;
          _box.write(kOtpTryCountKey, _otpTryCount.value);
          sendOtp();
        } else {
          printError(info: "sendOtp ▶ Failed to send OTP[✘]: Limit Exceeds");
          otpStatus.value = "otp_error_limit_exceeds".tr;
          _startTimer();
        }
      } else {
        printInfo(
            info:
                "sendOtp ▶ lastOtpSentTimeStamp: null ▶ reset all & send otp again...");
        //Reset all
        _otpTryCount.value = 0;
        _box.write(kOtpTryCountKey, _otpTryCount.value);
        sendOtp();
      }
    }
  }

  void _startTimer() {
    printInfo(info: "_startTimer ▶▶");
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        int remainingSeconds = _otpRemainingSeconds.value - timer.tick;
        if (remainingSeconds <= 0) {
          _timer?.cancel();
          _otpRemainingSeconds.value = 0;
          otpResendText1.value = "";
          otpResendText2.value = "Resend OTP";
        } else {
          String minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
          String seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
          otpResendText1.value = 'Resend OTP in';
          otpResendText2.value = '$minutes:$seconds';
        }
      },
    );
  }

  verifyOtp() {
    if (_otp.isEmpty) {
      _otp.value = _box.read(kLastSentOtpKey);
    }

    if (tcOtpController.text == _otp.value) {
      _authController.updateProfile();
    } else {
      otpStatus.value = "otp_error_not_matched".tr;
    }
  }

  void syncOtpStatus() {
    printInfo(info: "syncOtpStatus ▶▶");
    //check for last otp try count
    int? otpRetryCount = _box.read(kOtpTryCountKey);
    printInfo(info: "syncOtpStatus ▶ otpRetryCount: $otpRetryCount");
    if (otpRetryCount != null) _otpTryCount.value = otpRetryCount;

    //check for last otp sent time
    int? lastOtpSentTimeStamp = _box.read(kLastOtpSentTimeKey);
    printInfo(
        info: "syncOtpStatus ▶ lastOtpSentTimeStamp: $lastOtpSentTimeStamp");
    if (lastOtpSentTimeStamp != null) {
      DateTime lastSentTime =
          DateTime.fromMillisecondsSinceEpoch(lastOtpSentTimeStamp);
      Duration timeDiff = DateTime.now().difference(lastSentTime);
      printInfo(info: "syncOtpStatus ▶ timeDiff: $timeDiff");
      _otpRemainingSeconds.value = max(
          0,
          ((_otpTryCount <= kOtpMaxRetryCount)
                  ? kOtpRetryIntervalSeconds
                  : kOtpResetIntervalSeconds) -
              timeDiff.inSeconds);
    }
    printInfo(
        info:
            "syncOtpStatus ▶ _otpRemainingSeconds: ${_otpRemainingSeconds.value}");
    printInfo(info: "syncOtpStatus ◀◀");
  }

  String generateOTP() {
    printInfo(info: "generateOTP ▶▶");
    // Generate a random number within the range
    Random random = Random();
    int otp = kOtpMinRange + random.nextInt(kOtpMaxRange - kOtpMinRange);
    printInfo(info: "generateOTP ▶ otp: $otp");
    // Convert the OTP to a string and return it
    return otp.toString();
  }

  resendOtp() {
    printInfo(info: "resendOtp ▶▶ timer active: ${_timer?.isActive}");
    if (_timer != null && !_timer!.isActive) sendOtp();
  }
}
