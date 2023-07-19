import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/db_service.dart';

class AddressBookController extends GetxController {
  final DbService dbService = Get.find<DbService>();
  final selectedAddressPos = 0.obs;

  addAnAddress() {
    selectedAddressPos.value = 0;
    Get.toNamed(Routes.ADDRESS);
  }

  onAddressSelection(int index) {
    selectedAddressPos.value = index + 1;
    Get.toNamed(Routes.ADDRESS);
  }
}
