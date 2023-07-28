import 'package:realm/realm.dart';
import '../../util/app_constants.dart';

part 'schema.g.dart';

//Types
class UserRole {
  static const USER = 'USER';
  static const ORG = 'ORG';
  static const ADMIN = 'ADMIN';
  static const SUPER_ADMIN = 'SUPER_ADMIN';
}

class UserStatus {
  static const ACTIVE = 'ACTIVE';
  static const SUSPENDED = 'SUSPENDED';
  static const BLOCKED = 'BLOCKED';
  static const DELETED = 'BLOCKED';
}

class Availability {
  static const AVAILABLE = 'AVAILABLE';
  static const UNAVAILABLE = 'UNAVAILABLE';
}

class ReqType {
  static const PENDING = 'PENDING';
  static const ACCEPTED = 'ACCEPTED';
  static const COMPLETED = 'COMPLETED';
  static const REJECTED = 'REJECTED';
}

//Embedded Models
@RealmModel(ObjectType.embeddedObject)
class _Location {
  String lat = '';
  String lon = '';
}

@RealmModel(ObjectType.embeddedObject)
class _Address {
  late String name;
  late String mobile;
  String division = '';
  String city = '';
  String area = '';
  String addressLine = '';
  String label = '';
  _Location? location;
}

@RealmModel(ObjectType.embeddedObject)
class _UserInfo {
  late String name;
  late String mobile;
  String altMobile = '';
}

@RealmModel(ObjectType.embeddedObject)
class _BasicUser {
  late String userId;
  String name = '';
  String img = '';
}

//=====================Donation====================//
@RealmModel()
class _Donation {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String orgId;

  late String bloodGroup = '';
  String patientProblem = '';
  int amount = 1;
  DateTime neededAt = DateTime.now();
  _Address? address;

  late String seekerId;
  _UserInfo? seekerInfo;
  String seekerFeedback = '';

  String donorId = '';
  _UserInfo? donorInfo;
  String donorFeedback = '';

  String reqType = ReqType.PENDING;
  bool isVerified = false;
  String adminFeedback = '';

  DateTime createdAt = DateTime.now();
  late DateTime updatedAt;
}

//=====================Profile====================//

@RealmModel()
class _Profile {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String orgId;
  late String userId;

  String name = '';
  String mobile = '';
  String email = '';
  String role = UserRole.USER;
  String imgSrc = '';
  int rating = -1;
  List<_Review> recentReviews = List.empty();

  _Address? address;
  _Location? location;

  String bloodGroup = '';
  String availability = Availability.AVAILABLE;
  DateTime lastDonatedAt = DateTime.fromMillisecondsSinceEpoch(firstEpoch);
  List<_Donation> recentDonations = List.empty();
  List<_Donation> recentDonationRequests = List.empty();
  int totalDonations = 0;
  int totalRequests = 0;

  String status = UserStatus.ACTIVE;
  bool isVerified = false;
  bool isEmailVerified = false;
  bool isMobileVerified = false;
  String adminFeedback = '';

  DateTime createdAt = DateTime.now();
  late DateTime updatedAt;
}

//=====================Review====================//

@RealmModel()
class _Review {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  double value = 1;
  String desc = '';

  late String toUserId;
  _BasicUser? fromUser;

  DateTime createdAt = DateTime.now();
  late DateTime updatedAt;
}

//=====================Area====================//

@RealmModel(ObjectType.embeddedObject)
class _Area {
  String areaId = '';
  String areaName = '';
  int deliveryCost = 0;
}

@RealmModel(ObjectType.embeddedObject)
class _City {
  String cityId = '';
  String cityName = '';
  List<_Area> areas = [];
}

@RealmModel(ObjectType.embeddedObject)
class _Division {
  String divId = '';
  String divName = '';
  List<_City> cities = [];
}

@RealmModel()
class _AreaData {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  List<_Division> divisions = [];
  DateTime createdAt = DateTime.now();
  late DateTime updatedAt;
}
