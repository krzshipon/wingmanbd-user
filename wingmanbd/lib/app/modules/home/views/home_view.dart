// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../../../util/app_theme.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../exchange/views/exchange_view.dart';
import '../../setting/views/setting_view.dart';
import '../../store/views/store_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      // floatingActionButton: CSIconButton(
      //   icon: Icons.add_sharp,
      //   ontap: () => ,
      // ),
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: WaterDropNavBar(
            bottomPadding: GetPlatform.isAndroid ? 8 : null,
            backgroundColor: Get.theme.colorScheme.primary,
            waterDropColor: kcWaterDropColor,
            onItemSelected: (int index) {
              try {
                controller.selectedIndex.value = index;
                controller.pageController.animateToPage(
                    controller.selectedIndex.value,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutQuad);
              } catch (e) {
                printError(info: "HomeView>>> bottomNavBar ${e.toString()}");
              }
            },
            selectedIndex: controller.selectedIndex.value,
            barItems: <BarItem>[
              BarItem(
                  filledIcon: Icons.dashboard_rounded,
                  outlinedIcon: Icons.dashboard_outlined),
              BarItem(
                  filledIcon: Icons.swap_horizontal_circle_sharp,
                  outlinedIcon: Icons.swap_horizontal_circle_outlined),
              BarItem(
                  filledIcon: Icons.store_mall_directory_sharp,
                  outlinedIcon: Icons.store_mall_directory_outlined),
              BarItem(
                filledIcon: Icons.settings,
                outlinedIcon: Icons.settings_outlined,
              ),
            ],
          ),
        ),
      ),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: DashboardView(),
          ),
          Container(
            alignment: Alignment.center,
            child: ExchangeView(),
          ),
          Container(
            alignment: Alignment.center,
            child: StoreView(),
          ),
          Container(
            alignment: Alignment.center,
            child: SettingView(),
          ),
        ],
      ),
    );
  }
}
