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
  final GetStorage _box = GetStorage();
  final AuthService _authService = Get.find<AuthService>();

  TextEditingController tcUserName = TextEditingController();
  TextEditingController tcUserMobile = TextEditingController();
  TextEditingController tcUserPass = TextEditingController();
  TextEditingController tcUserConfirmPass = TextEditingController();
  TextEditingController tcUserEmail = TextEditingController();

  final userBloodGroup = ''.obs;

  final authType = AuthType.SIGNIN.obs;

  final error = ''.obs;
  final errorName = ''.obs;
  final errorMobile = ''.obs;
  final errorPass = ''.obs;
  final errorConfirmPass = ''.obs;
  final errorEmail = ''.obs;
  final errorGroup = ''.obs;

  final hasError = false.obs;

  @override
  void onInit() {
    if (_authService.currentUser.value != null) {
      Get.offNamed(Routes.HOME);
    }
    super.onInit();
    bindListeners();
  }

  @override
  void onReady() {
    super.onReady();
    syncAuth();
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

  void bindListeners() {
    tcUserName.addListener(() {
      errorName.value = '';
      error.value = '';
    });
    tcUserMobile.addListener(() {
      errorMobile.value = '';
      error.value = '';
      _box.write(kKeyUserEmail, tcUserMobile.text);
    });
    tcUserPass.addListener(() {
      errorPass.value = '';
      error.value = '';
      _box.write(kKeyUserPass, tcUserPass.text);
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

  void syncAuth() {
    authType.value = _box.read(kKeyUserLastAuthType) == kAuthTypeLogin
        ? AuthType.SIGNIN
        : AuthType.SIGNUP;

    if (authType.value == AuthType.SIGNIN) {
      tcUserMobile.text = _box.read(kKeyUserEmail) ?? '';
      tcUserPass.text = _box.read(kKeyUserPass) ?? '';
    }
  }

  void authenticateUser() async {
    printInfo(info: 'authenticateUser => Auth Type: ${authType.value}');
    //Hide keyboard first
    hideKeyBoard();
    //Check inputted data
    validateFields();
    //Check if there is any validation error
    printInfo(info: 'authenticateUser => hasError: $hasError');
    if (hasError.isFalse) {
      Get.showLoader();
      if (authType.value == AuthType.SIGNIN) {
        printInfo(info: 'authenticateUser => Log In ->');
        await _authService
            .logInUserEmailPw(tcUserMobile.text, tcUserPass.text)
            .then((value) {
          printInfo(info: 'authenticateUser => Log In -> Success');
          Get.hideLoader();
          Get.offNamed(Routes.HOME);
        }).onError((err, stackTrace) {
          printError(
              info: 'authenticateUser => Log In -> Error: ${err.toString()}');
          Get.hideLoader();
          error.value = 'auth_error_sign_in'.tr;
        });
      } else {
        printInfo(info: 'authenticateUser => Register ->');
        await _authService
            .registerUserEmailPw(tcUserMobile.text, tcUserPass.text)
            .then((value) {
          printInfo(info: 'authenticateUser => Register -> Success');
          saveUserData();
          Get.hideLoader();
          Get.toNamed(Routes.OTP);
        }).onError((err, stackTrace) {
          printError(
              info: 'authenticateUser => Register -> Error: ${err.toString()}');
          error.value = 'auth_error_sign_up'.tr;
          authType.value = AuthType.SIGNIN;
          Get.hideLoader();
        });
      }
    }
  }

  switchAuthType() {
    authType.value = authType.value == AuthType.SIGNIN
        ? AuthType.SIGNUP
        : authType.value = AuthType.SIGNIN;
    _box.write(kKeyUserLastAuthType,
        authType.value == AuthType.SIGNIN ? kAuthTypeLogin : kAuthTypeSignup);
    clearErrors();
    clearMobile();
    clearPassword();
    if (authType.value == AuthType.SIGNIN) {
      tcUserMobile.text = _box.read(kKeyUserEmail) ?? '';
      tcUserPass.text = _box.read(kKeyUserPass) ?? '';
    }
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
    //Blood Group
    if (userBloodGroup.isEmpty ||
        !kBloodGroups.contains(userBloodGroup.value)) {
      hasError.value = true;
      errorGroup.value = 'auth_error_group'.tr;
    }
  }

  void clearErrors() {
    error.value = '';
    errorName.value = '';
    errorMobile.value = '';
    errorPass.value = '';
    errorConfirmPass.value = '';
    errorEmail.value = '';
    errorGroup.value = '';
    hasError.value = false;
  }

  void clearPassword() {
    tcUserPass.clear();
    tcUserConfirmPass.clear();
  }

  void clearMobile() {
    tcUserMobile.clear();
  }

  void updateGroup(String? value) {
    printInfo(info: 'updateGroup >>> value: $value');
    if (value != null && kBloodGroups.contains(value)) {
      errorGroup.value = '';
      userBloodGroup.value = value;
    }
  }

  void saveUserData() {
    printInfo(info: 'saveUserData >-> Saving User Data...');
    _box.write(kKeyUserName, tcUserName.text);
    final updatedCustomUserData = {
      kKeyUserName: tcUserName.text,
      kKeyUserMobile: tcUserMobile.text,
      kKeyUserEmail: tcUserEmail.text,
      kKeyUserBloodGroup: userBloodGroup.value
    };
    _box.write(kKeyUserPendingProfile, updatedCustomUserData);
    printInfo(info: 'saveUserData => User Data Saved <-<');
  }
}
