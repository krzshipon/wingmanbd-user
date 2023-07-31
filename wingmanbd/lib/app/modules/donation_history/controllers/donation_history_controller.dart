import 'package:get/get.dart';
import 'package:realm/realm.dart';
import 'package:wingmanbd/app/data/models/schema.dart';
import 'package:wingmanbd/app/routes/app_pages.dart';
import 'package:wingmanbd/app/util/app_constants.dart';

class DonationHistoryController extends GetxController {
  final donations = <Donation>[].obs;
  @override
  void onInit() {
    super.onInit();
    donations.add(
      Donation(
        ObjectId(),
        kOrgId,
        ObjectId().toString(),
        DateTime.now(),
        bloodGroup: "O+",
        patientProblem: "Dengue Fever",
        neededAt: DateTime.now().add(
          const Duration(days: 7),
        ),
        seekerInfo: UserInfo("John", "01000200300"),
        address: Address("John", "01000200300", addressLine: "Square Hospital"),
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  viewDonationDetail(int index) {
    Get.toNamed(Routes.DONATION);
  }
}
