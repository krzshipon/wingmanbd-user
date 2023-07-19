import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CSText.label("Coming soon..."),
    );
  }
}
