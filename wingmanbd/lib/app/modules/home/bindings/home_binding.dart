import 'package:get/get.dart';

import '../../dashboard/controllers/dashboard_controller.dart';
import '../../exchange/controllers/exchange_controller.dart';
import '../../setting/controllers/setting_controller.dart';
import '../../store/controllers/store_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<ExchangeController>(
      () => ExchangeController(),
    );
    Get.lazyPut<StoreController>(
      () => StoreController(),
    );
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
