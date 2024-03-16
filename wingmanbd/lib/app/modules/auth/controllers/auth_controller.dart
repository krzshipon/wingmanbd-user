import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:wingmanbd/app/extensions/string_ext.dart';

import '../../../data/data_keys.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';
import '../../../util/app_constants.dart';

// ignore: constant_identifier_names
enum AuthType { SIGNIN, SIGNUP }

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final GetStorage box = GetStorage();

  TextEditingController tcUserName = TextEditingController();
  TextEditingController tcUserMobile = TextEditingController();
  TextEditingController tcUserPass = TextEditingController();
  TextEditingController tcUserConfirmPass = TextEditingController();
  TextEditingController tcUserEmail = TextEditingController();

  final authType = AuthType.SIGNIN.obs;

  final errorName = ''.obs;
  final errorMobile = ''.obs;
  final errorPass = ''.obs;
  final errorConfirmPass = ''.obs;
  final errorEmail = ''.obs;
  final error = ''.obs;

  final hasError = false.obs;

  @override
  void onInit() {
    if (_authService.currentUser.value != null) {
      Get.offNamed(Routes.HOME);
    }
    super.onInit();
    bindListeners();
  }

  void bindListeners() {
    tcUserName.addListener(() {
      errorName.value = '';
      error.value = '';
    });
    tcUserMobile.addListener(() {
      errorMobile.value = '';
      error.value = '';
      box.write(kUserEmail, tcUserMobile.text);
    });
    tcUserPass.addListener(() {
      errorPass.value = '';
      error.value = '';
      box.write(kUserPass, tcUserPass.text);
    });
    tcUserConfirmPass.addListener(() {
      errorConfirmPass.value = '';
      error.value = '';
    });
    tcUserEmail.addListener(() {
      errorEmail.value = '';
      error.value = '';
    });
  }

  @override
  void onClose() {
    //Dispose Controllers
    tcUserName.dispose();
    tcUserMobile.dispose();
    tcUserPass.dispose();
    tcUserConfirmPass.dispose();
    tcUserEmail.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    authType.value = box.read(kUserLastAuthType) == kAuthTypeLogin
        ? AuthType.SIGNIN
        : AuthType.SIGNUP;

    if (authType.value == AuthType.SIGNIN) {
      tcUserMobile.text = box.read(kUserEmail) ?? "";
      tcUserPass.text = box.read(kUserPass) ?? "";
    }
  }

  authenticateUser() async {
    //Hide keyboard first
    hideKeyBoard();
    //Check inputted data
    validateFields();
    //Check if there is any validation error
    if (hasError.isFalse) {
      Get.showLoader();
      if (authType.value == AuthType.SIGNIN) {
        try {
          await _authService.logInUserEmailPw(
              tcUserMobile.text, tcUserPass.text);
          Get.hideLoader();
          Get.offNamed(Routes.HOME);
        } catch (err) {
          Get.hideLoader();
          error.value = 'auth_error_sign_in'.tr;
          printError(info: 'Auth Error: ${err.toString()}');
        }
      } else {
        try {
          await _authService.registerUserEmailPw(
              tcUserMobile.text, tcUserPass.text);
          Get.hideLoader();
          Get.toNamed(Routes.OTP);

          // if (_authService.currentUser.value != null) {
          //   updateProfile();
          // } else {
          //   authType.value = AuthType.SIGNIN;
          // }
        } catch (err) {
          Get.hideLoader();
          error.value = 'auth_error_sign_up'.tr;
          authType.value = AuthType.SIGNIN;
          printError(info: 'Auth Error: ${err.toString()}');
        }
      }
    }
  }

  updateProfile() async {
    Get.showLoader();
    final updatedCustomUserData = {
      "orgId": '1',
      "userId": _authService.currentUser.value?.id,
      "name": tcUserName.text,
      "mobile": tcUserMobile.text,
      "email": tcUserEmail.text,
      "imgSrc": "",
      "bloodGroup": 'O+',
      "availability": 'AVAILABLE',
      "address": null,
      "location": null
    };

    await _authService.currentUser.value?.functions
        .call(kfUpdateUserProfile, [updatedCustomUserData]).then((value) {
      _authService.refreshUserData().then((value) {
        Get.hideLoader();
        Get.offAllNamed(Routes.HOME);
      }).catchError((e) {
        Get.hideLoader();
      });
    }).catchError(
      (e) {
        Get.hideLoader();
        error.value = 'auth_error_sign_up'.tr;
        authType.value = AuthType.SIGNIN;
        printError(info: 'Auth Error: ${e.toString()}');
      },
    );
  }

  switchAuthType() {
    authType.value = authType.value == AuthType.SIGNIN
        ? AuthType.SIGNUP
        : authType.value = AuthType.SIGNIN;
    box.write(kUserLastAuthType,
        authType.value == AuthType.SIGNIN ? kAuthTypeLogin : kAuthTypeSignup);
    clearErrors();
    clearMobile();
    clearPassword();
    if (authType.value == AuthType.SIGNIN) {
      tcUserMobile.text = box.read(kUserEmail) ?? "";
      tcUserPass.text = box.read(kUserPass) ?? "";
    }
  }

  void clearErrors() {
    error.value = '';
    errorName.value = '';
    errorMobile.value = '';
    errorPass.value = '';
    errorConfirmPass.value = '';
    errorEmail.value = '';
    hasError.value = false;
  }

  void validateFields() {
    hasError.value = false;
    //validate common data first
    //Mobile
    if (!tcUserMobile.text.isPhoneNumber) {
      hasError.value = true;
      errorMobile.value = 'auth_error_mobile'.tr;
    }
    //Pass
    if (!tcUserPass.text.isValidPassword) {
      hasError.value = true;
      errorPass.value = 'auth_error_password_length'.tr;
    }

    //No need to check rest if sign in
    if (authType.value == AuthType.SIGNIN) return;

    //Name
    if (!tcUserName.text.isValidName) {
      hasError.value = true;
      errorName.value = 'auth_error_name'.tr;
    }
    //Confirm Pass
    if (tcUserConfirmPass.text != tcUserPass.text) {
      hasError.value = true;
      errorConfirmPass.value = 'auth_error_password_not_matched'.tr;
    }
    //Email
    if (tcUserEmail.text.isNotEmpty && !tcUserEmail.text.isEmail) {
      hasError.value = true;
      errorEmail.value = 'auth_error_email'.tr;
    }
  }

  void clearPassword() {
    tcUserPass.clear();
    tcUserConfirmPass.clear();
  }

  void clearMobile() {
    tcUserMobile.clear();
  }
}
