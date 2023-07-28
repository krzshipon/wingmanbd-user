import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:wingmanbd/app/util/app_constants.dart';

import '../../../data/models/schema.dart' as app_feedback;
import '../../../services/auth_service.dart';
import '../../../services/db_service.dart';

class FeedbackController extends GetxController {
  final _dbService = Get.find<DbService>();
  final _authService = Get.find<AuthService>();

  final tcFeedback = TextEditingController();

  @override
  void onClose() {}

  Future<void> sendFeedback() async {
    var msg = tcFeedback.text;
    if (msg.isNotEmpty) {
      Get.showLoader();
      try {
        _dbService.realm?.write(
          () => _dbService.realm?.add<app_feedback.Feedback>(
            app_feedback.Feedback(
              ObjectId(),
              orgId,
              _authService.currentUser.value?.id ?? '',
              DateTime.now(),
              feedback: msg,
            ),
          ),
        );
        Get.hideLoader();
        Get.back();
      } catch (e) {
        e.printError();
        Get.hideLoader();
        Get.back();
      }
    } else {
      Get.hideLoader();
      Get.back();
    }
  }
}
