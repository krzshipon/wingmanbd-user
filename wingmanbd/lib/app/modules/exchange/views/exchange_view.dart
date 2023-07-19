import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/exchange_controller.dart';

class ExchangeView extends GetView<ExchangeController> {
  const ExchangeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CSText.label("Coming soon..."),
    );
  }
}
