import 'package:realm/realm.dart';

part 'profile.g.dart';

class UserRole {
  static const USER = 'USER';
  static const ADMIN = 'ADMIN';
  static const SUPER_ADMIN = 'SUPER_ADMIN';
}

class UserStatus {
  static const ACTIVE = 'ACTIVE';
  static const SUSPENDED = 'SUSPENDED';
  static const BLOCKED = 'BLOCKED';
}

@RealmModel(ObjectType.embeddedObject)
class _Address {
  String name = '';
  String mobile = '';
  String division = '';
  String city = '';
  String area = '';
  String addressLine = '';
  String label = '';
  bool isDefault = false;
}

@RealmModel()
class _Profile {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String userId;

  @Indexed()
  String name = '';
  @Indexed()
  String mobile = '';
  @Indexed()
  String email = '';
  String img = '';
  @Indexed()
  String role = UserRole.USER;
  @Indexed()
  String status = UserStatus.ACTIVE;
  String deactivationReason = '';

  bool isEmailVerified = false;
  bool isMobileVerified = false;
  bool isVerified = false;

  List<_Address> addressBook = [];

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
