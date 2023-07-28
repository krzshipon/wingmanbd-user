import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:wingmanbd/app/data/models/schema.dart';
import 'package:wingmanbd/app/extensions/string_ext.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';
import '../../../services/db_service.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final DbService dbService = Get.find<DbService>();

  final tcName = TextEditingController();
  final tcEmail = TextEditingController();

  final errorName = ''.obs;
  final errorEmail = ''.obs;
  final error = ''.obs;
  final hasError = false.obs;

  final editModeActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    bindListeners();
  }

  void bindListeners() {
    tcName.addListener(() {
      errorName.value = '';
      error.value = '';
    });
    tcEmail.addListener(() {
      errorEmail.value = '';
      error.value = '';
    });
  }

  @override
  void onClose() {
    tcName.dispose();
    tcEmail.dispose();
    super.onClose();
  }

  void onEditButtonTap() {
    //hide keyboard first...
    hideKeyBoard();
    //check edit mode is active...
    if (editModeActive.isTrue) {
      //Submit changes
      updateProfile();
    } else {
      tcName.text = dbService.profile.value?.name ?? '';
      tcEmail.text = dbService.profile.value?.email ?? '';
    }
    //Toggle the value now
    editModeActive.toggle();
  }

  logOut() async {
    Get.showLoader();
    await _authService.logOutUser();
    Get.hideLoader();
    Get.offAllNamed(Routes.AUTH);
  }

  changeMobile() {
    Get.snackbar('app_under_development'.tr, 'app_coming_soon'.tr);
  }

  changePass() {
    Get.snackbar('app_under_development'.tr, 'app_coming_soon'.tr);
  }

  updateProfile() {
    //Hide keyboard first
    hideKeyBoard();
    //Check inputted data
    validateFields();
    //Check if there is any validation error
    if (hasError.isFalse) {
      if (dbService.profile.value != null) {
        dbService.realm?.write(
          () => {
            dbService.profile.value?.name = tcName.text,
            dbService.profile.value?.email = tcEmail.text,
          },
        );
      }
    }
  }

  void validateFields() {
    hasError.value = false;
    //validate common data first
    //Mobile
    if (!tcName.text.isValidName) {
      hasError.value = true;
      errorName.value = 'auth_error_mobile'.tr;
    }
    //Pass
    if (!tcEmail.text.isEmail) {
      hasError.value = true;
      errorEmail.value = 'auth_error_email'.tr;
    }
  }

  void onAvailabilityChange(bool value) {
    dbService.realm?.write(() {
      dbService.profile.value?.availability =
          value ? Availability.AVAILABLE : Availability.UNAVAILABLE;
      dbService.profile.refresh();
    });
  }
}
