import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/asset_keys.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      floatingActionButton: Obx(() => CSIconButton(
            icon: controller.editModeActive.value
                ? Icons.check_sharp
                : Icons.edit_sharp,
            onTap: () => controller.onEditButtonTap(),
          )),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'profile_title'.tr,
          ),
          verticalSpaceSmall,
          CSCard(
            children: [
              verticalSpaceSmall,
              (controller.dbService.profile.value?.img.isEmpty ?? true)
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 50,
                        foregroundColor: Get.theme.colorScheme.secondary,
                        backgroundColor: Get.theme.colorScheme.secondary,
                        backgroundImage: const AssetImage(kProfileImage),
                      ),
                    )
                  : Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 50,
                        foregroundColor: Get.theme.colorScheme.secondary,
                        backgroundColor: Get.theme.colorScheme.secondary,
                        backgroundImage: NetworkImage(
                            controller.dbService.profile.value!.img),
                      ),
                    ),
              verticalSpaceTiny,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (!controller.editModeActive.value)
                        ? CSText.title(
                            controller.dbService.profile.value?.name ??
                                'profile_error_name'.tr)
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CSInputField(
                                maxLines: 1,
                                controller: controller.tcName,
                                placeholder: 'profile_label_name'.tr,
                                inputType: TextInputType.name,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (!controller.editModeActive.value)
                        ? CSText.label(
                            controller.dbService.profile.value?.email ??
                                'profile_error_email'.tr)
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CSInputField(
                                maxLines: 1,
                                controller: controller.tcEmail,
                                placeholder: 'profile_label_email'.tr,
                                inputType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpaceLarge,
          Expanded(
            child: ListView(
              children: [
                ProfileItem(
                  iconData: Icons.library_books_sharp,
                  title: 'profile_item_address_book'.tr,
                  onTap: () => controller.gotoAddressBook(),
                ),
                ProfileItem(
                  iconData: Icons.call_end_sharp,
                  title: 'profile_item_change_mobile'.tr,
                  onTap: () => controller.changeMobile(),
                ),
                ProfileItem(
                  iconData: Icons.password_sharp,
                  title: 'profile_item_change_password'.tr,
                  onTap: () => controller.changePass(),
                ),
                ProfileItem(
                  iconData: Icons.logout_sharp,
                  title: 'profile_item_logout'.tr,
                  onTap: (() => controller.logOut()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
