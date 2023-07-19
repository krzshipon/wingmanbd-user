import 'package:super_ui_kit/super_ui_kit.dart';

import '../data/models/profile.dart';

extension AddressExt on Address {
  CsAddress toCsAddress() {
    return CsAddress(
      name: name,
      mobile: mobile,
      addressLine: addressLine,
      city: city,
      area: area,
      division: division,
      label: label,
      isDefault: isDefault,
    );
  }
}
