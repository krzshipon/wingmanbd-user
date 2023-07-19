import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/data_keys.dart';
import '../../../services/db_service.dart';

class DashboardController extends GetxController {
  DbService dbService = Get.find<DbService>();
  GetStorage box = GetStorage();

  final name = ''.obs;

  @override
  void onInit() {
    name.value = box.read<String>(kUserName) ?? '';
    super.onInit();
  }

  void getUserName() {
    var userName = box.read<String>(kUserName);
    if (userName != null) {
      name.value = userName;
    }
  }
}
