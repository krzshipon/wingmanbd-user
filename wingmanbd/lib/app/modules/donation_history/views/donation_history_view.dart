import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import '../controllers/donation_history_controller.dart';

class DonationHistoryView extends GetView<DonationHistoryController> {
  const DonationHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      // floatingActionButton: Obx(
      //   () => CSIconButton(
      //     icon: controller.editModeActive.value
      //         ? Icons.check_sharp
      //         : Icons.edit_sharp,
      //     onTap: () => controller.onEditButtonTap(),
      //   ),
      // ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'donation_history_title'.tr,
          ),
          verticalSpaceSmall,
          const Expanded(
              child: Center(
            child: CSText('You have no donation yet!'),
          ))
        ],
      ),
    );
  }
}
