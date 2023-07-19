import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:wingmanbd/app/extensions/address_ext.dart';

import '../controllers/address_book_controller.dart';

class AddressBookView extends GetView<AddressBookController> {
  const AddressBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      floatingActionButton: CSIconButton(
        icon: Icons.add_location_alt_outlined,
        onTap: () => controller.addAnAddress(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'address_book_title'.tr,
          ),
          verticalSpaceSmall,
          Expanded(
            child: Obx(
              () => LiveList.options(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: animationItemBuilder(
                  (index) => AddressItem(
                    controller.dbService.profile.value?.addressBook[index]
                            .toCsAddress() ??
                        CsAddress(),
                    onTap: () => controller.onAddressSelection(index),
                  ),
                ),
                itemCount:
                    controller.dbService.profile.value?.addressBook.length ?? 0,
                options: kAnimationOptions,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
