// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Location extends _Location
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Location({
    String lat = '',
    String lon = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Location>({
        'lat': '',
        'lon': '',
      });
    }
    RealmObjectBase.set(this, 'lat', lat);
    RealmObjectBase.set(this, 'lon', lon);
  }

  Location._();

  @override
  String get lat => RealmObjectBase.get<String>(this, 'lat') as String;
  @override
  set lat(String value) => RealmObjectBase.set(this, 'lat', value);

  @override
  String get lon => RealmObjectBase.get<String>(this, 'lon') as String;
  @override
  set lon(String value) => RealmObjectBase.set(this, 'lon', value);

  @override
  Stream<RealmObjectChanges<Location>> get changes =>
      RealmObjectBase.getChanges<Location>(this);

  @override
  Location freeze() => RealmObjectBase.freezeObject<Location>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Location._);
    return const SchemaObject(ObjectType.embeddedObject, Location, 'Location', [
      SchemaProperty('lat', RealmPropertyType.string),
      SchemaProperty('lon', RealmPropertyType.string),
    ]);
  }
}

class Address extends _Address
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Address(
    String name,
    String mobile, {
    String division = '',
    String city = '',
    String area = '',
    String addressLine = '',
    String label = '',
    Location? location,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Address>({
        'division': '',
        'city': '',
        'area': '',
        'addressLine': '',
        'label': '',
      });
    }
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'mobile', mobile);
    RealmObjectBase.set(this, 'division', division);
    RealmObjectBase.set(this, 'city', city);
    RealmObjectBase.set(this, 'area', area);
    RealmObjectBase.set(this, 'addressLine', addressLine);
    RealmObjectBase.set(this, 'label', label);
    RealmObjectBase.set(this, 'location', location);
  }

  Address._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get mobile => RealmObjectBase.get<String>(this, 'mobile') as String;
  @override
  set mobile(String value) => RealmObjectBase.set(this, 'mobile', value);

  @override
  String get division =>
      RealmObjectBase.get<String>(this, 'division') as String;
  @override
  set division(String value) => RealmObjectBase.set(this, 'division', value);

  @override
  String get city => RealmObjectBase.get<String>(this, 'city') as String;
  @override
  set city(String value) => RealmObjectBase.set(this, 'city', value);

  @override
  String get area => RealmObjectBase.get<String>(this, 'area') as String;
  @override
  set area(String value) => RealmObjectBase.set(this, 'area', value);

  @override
  String get addressLine =>
      RealmObjectBase.get<String>(this, 'addressLine') as String;
  @override
  set addressLine(String value) =>
      RealmObjectBase.set(this, 'addressLine', value);

  @override
  String get label => RealmObjectBase.get<String>(this, 'label') as String;
  @override
  set label(String value) => RealmObjectBase.set(this, 'label', value);

  @override
  Location? get location =>
      RealmObjectBase.get<Location>(this, 'location') as Location?;
  @override
  set location(covariant Location? value) =>
      RealmObjectBase.set(this, 'location', value);

  @override
  Stream<RealmObjectChanges<Address>> get changes =>
      RealmObjectBase.getChanges<Address>(this);

  @override
  Address freeze() => RealmObjectBase.freezeObject<Address>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Address._);
    return const SchemaObject(ObjectType.embeddedObject, Address, 'Address', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('mobile', RealmPropertyType.string),
      SchemaProperty('division', RealmPropertyType.string),
      SchemaProperty('city', RealmPropertyType.string),
      SchemaProperty('area', RealmPropertyType.string),
      SchemaProperty('addressLine', RealmPropertyType.string),
      SchemaProperty('label', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.object,
          optional: true, linkTarget: 'Location'),
    ]);
  }
}

class UserInfo extends _UserInfo
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  UserInfo(
    String name,
    String mobile, {
    String altMobile = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<UserInfo>({
        'altMobile': '',
      });
    }
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'mobile', mobile);
    RealmObjectBase.set(this, 'altMobile', altMobile);
  }

  UserInfo._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get mobile => RealmObjectBase.get<String>(this, 'mobile') as String;
  @override
  set mobile(String value) => RealmObjectBase.set(this, 'mobile', value);

  @override
  String get altMobile =>
      RealmObjectBase.get<String>(this, 'altMobile') as String;
  @override
  set altMobile(String value) => RealmObjectBase.set(this, 'altMobile', value);

  @override
  Stream<RealmObjectChanges<UserInfo>> get changes =>
      RealmObjectBase.getChanges<UserInfo>(this);

  @override
  UserInfo freeze() => RealmObjectBase.freezeObject<UserInfo>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UserInfo._);
    return const SchemaObject(ObjectType.embeddedObject, UserInfo, 'UserInfo', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('mobile', RealmPropertyType.string),
      SchemaProperty('altMobile', RealmPropertyType.string),
    ]);
  }
}

class BasicUser extends _BasicUser
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  BasicUser(
    String userId, {
    String name = '',
    String img = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<BasicUser>({
        'name': '',
        'img': '',
      });
    }
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'img', img);
  }

  BasicUser._();

  @override
  String get userId => RealmObjectBase.get<String>(this, 'userId') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'userId', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get img => RealmObjectBase.get<String>(this, 'img') as String;
  @override
  set img(String value) => RealmObjectBase.set(this, 'img', value);

  @override
  Stream<RealmObjectChanges<BasicUser>> get changes =>
      RealmObjectBase.getChanges<BasicUser>(this);

  @override
  BasicUser freeze() => RealmObjectBase.freezeObject<BasicUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(BasicUser._);
    return const SchemaObject(
        ObjectType.embeddedObject, BasicUser, 'BasicUser', [
      SchemaProperty('userId', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('img', RealmPropertyType.string),
    ]);
  }
}

class Donation extends _Donation
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Donation(
    ObjectId id,
    String orgId,
    String seekerId,
    DateTime updatedAt, {
    String bloodGroup = '',
    String patientProblem = '',
    int amount = 1,
    required neededAt,
    Address? address,
    UserInfo? seekerInfo,
    String seekerFeedback = '',
    String donorId = '',
    UserInfo? donorInfo,
    String donorFeedback = '',
    String reqType = ReqType.PENDING,
    bool isVerified = false,
    String adminFeedback = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Donation>({
        'bloodGroup': '',
        'patientProblem': '',
        'amount': 1,
        'neededAt': DateTime.now(),
        'seekerFeedback': '',
        'donorId': '',
        'donorFeedback': '',
        'reqType': ReqType.PENDING,
        'isVerified': false,
        'adminFeedback': '',
        'createdAt': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'orgId', orgId);
    RealmObjectBase.set(this, 'bloodGroup', bloodGroup);
    RealmObjectBase.set(this, 'patientProblem', patientProblem);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'neededAt', neededAt);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'seekerId', seekerId);
    RealmObjectBase.set(this, 'seekerInfo', seekerInfo);
    RealmObjectBase.set(this, 'seekerFeedback', seekerFeedback);
    RealmObjectBase.set(this, 'donorId', donorId);
    RealmObjectBase.set(this, 'donorInfo', donorInfo);
    RealmObjectBase.set(this, 'donorFeedback', donorFeedback);
    RealmObjectBase.set(this, 'reqType', reqType);
    RealmObjectBase.set(this, 'isVerified', isVerified);
    RealmObjectBase.set(this, 'adminFeedback', adminFeedback);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
  }

  Donation._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get orgId => RealmObjectBase.get<String>(this, 'orgId') as String;
  @override
  set orgId(String value) => RealmObjectBase.set(this, 'orgId', value);

  @override
  String get bloodGroup =>
      RealmObjectBase.get<String>(this, 'bloodGroup') as String;
  @override
  set bloodGroup(String value) =>
      RealmObjectBase.set(this, 'bloodGroup', value);

  @override
  String get patientProblem =>
      RealmObjectBase.get<String>(this, 'patientProblem') as String;
  @override
  set patientProblem(String value) =>
      RealmObjectBase.set(this, 'patientProblem', value);

  @override
  int get amount => RealmObjectBase.get<int>(this, 'amount') as int;
  @override
  set amount(int value) => RealmObjectBase.set(this, 'amount', value);

  @override
  DateTime get neededAt =>
      RealmObjectBase.get<DateTime>(this, 'neededAt') as DateTime;
  @override
  set neededAt(DateTime value) => RealmObjectBase.set(this, 'neededAt', value);

  @override
  Address? get address =>
      RealmObjectBase.get<Address>(this, 'address') as Address?;
  @override
  set address(covariant Address? value) =>
      RealmObjectBase.set(this, 'address', value);

  @override
  String get seekerId =>
      RealmObjectBase.get<String>(this, 'seekerId') as String;
  @override
  set seekerId(String value) => RealmObjectBase.set(this, 'seekerId', value);

  @override
  UserInfo? get seekerInfo =>
      RealmObjectBase.get<UserInfo>(this, 'seekerInfo') as UserInfo?;
  @override
  set seekerInfo(covariant UserInfo? value) =>
      RealmObjectBase.set(this, 'seekerInfo', value);

  @override
  String get seekerFeedback =>
      RealmObjectBase.get<String>(this, 'seekerFeedback') as String;
  @override
  set seekerFeedback(String value) =>
      RealmObjectBase.set(this, 'seekerFeedback', value);

  @override
  String get donorId => RealmObjectBase.get<String>(this, 'donorId') as String;
  @override
  set donorId(String value) => RealmObjectBase.set(this, 'donorId', value);

  @override
  UserInfo? get donorInfo =>
      RealmObjectBase.get<UserInfo>(this, 'donorInfo') as UserInfo?;
  @override
  set donorInfo(covariant UserInfo? value) =>
      RealmObjectBase.set(this, 'donorInfo', value);

  @override
  String get donorFeedback =>
      RealmObjectBase.get<String>(this, 'donorFeedback') as String;
  @override
  set donorFeedback(String value) =>
      RealmObjectBase.set(this, 'donorFeedback', value);

  @override
  String get reqType => RealmObjectBase.get<String>(this, 'reqType') as String;
  @override
  set reqType(String value) => RealmObjectBase.set(this, 'reqType', value);

  @override
  bool get isVerified => RealmObjectBase.get<bool>(this, 'isVerified') as bool;
  @override
  set isVerified(bool value) => RealmObjectBase.set(this, 'isVerified', value);

  @override
  String get adminFeedback =>
      RealmObjectBase.get<String>(this, 'adminFeedback') as String;
  @override
  set adminFeedback(String value) =>
      RealmObjectBase.set(this, 'adminFeedback', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  Stream<RealmObjectChanges<Donation>> get changes =>
      RealmObjectBase.getChanges<Donation>(this);

  @override
  Donation freeze() => RealmObjectBase.freezeObject<Donation>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Donation._);
    return const SchemaObject(ObjectType.realmObject, Donation, 'Donation', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('orgId', RealmPropertyType.string),
      SchemaProperty('bloodGroup', RealmPropertyType.string),
      SchemaProperty('patientProblem', RealmPropertyType.string),
      SchemaProperty('amount', RealmPropertyType.int),
      SchemaProperty('neededAt', RealmPropertyType.timestamp),
      SchemaProperty('address', RealmPropertyType.object,
          optional: true, linkTarget: 'Address'),
      SchemaProperty('seekerId', RealmPropertyType.string),
      SchemaProperty('seekerInfo', RealmPropertyType.object,
          optional: true, linkTarget: 'UserInfo'),
      SchemaProperty('seekerFeedback', RealmPropertyType.string),
      SchemaProperty('donorId', RealmPropertyType.string),
      SchemaProperty('donorInfo', RealmPropertyType.object,
          optional: true, linkTarget: 'UserInfo'),
      SchemaProperty('donorFeedback', RealmPropertyType.string),
      SchemaProperty('reqType', RealmPropertyType.string),
      SchemaProperty('isVerified', RealmPropertyType.bool),
      SchemaProperty('adminFeedback', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}

class Profile extends _Profile with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Profile(
    ObjectId id,
    String orgId,
    String userId,
    DateTime updatedAt, {
    String name = '',
    String mobile = '',
    String email = '',
    String role = UserRole.USER,
    String imgSrc = '',
    int rating = -1,
    Address? address,
    Location? location,
    String bloodGroup = '',
    String availability = Availability.AVAILABLE,
    required DateTime lastDonatedAt,
    int totalDonations = 0,
    int totalRequests = 0,
    String status = UserStatus.ACTIVE,
    bool isVerified = false,
    bool isEmailVerified = false,
    bool isMobileVerified = false,
    Iterable<Review> recentReviews = const [],
    Iterable<Donation> recentDonations = const [],
    Iterable<Donation> recentDonationRequests = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Profile>({
        'name': '',
        'mobile': '',
        'email': '',
        'role': UserRole.USER,
        'imgSrc': '',
        'rating': -1,
        'bloodGroup': '',
        'availability': Availability.AVAILABLE,
        'lastDonatedAt': DateTime.fromMillisecondsSinceEpoch(firstEpoch),
        'totalDonations': 0,
        'totalRequests': 0,
        'status': UserStatus.ACTIVE,
        'isVerified': false,
        'isEmailVerified': false,
        'isMobileVerified': false,
        'createdAt': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'orgId', orgId);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'mobile', mobile);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'role', role);
    RealmObjectBase.set(this, 'imgSrc', imgSrc);
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'bloodGroup', bloodGroup);
    RealmObjectBase.set(this, 'availability', availability);
    RealmObjectBase.set(this, 'lastDonatedAt', lastDonatedAt);
    RealmObjectBase.set(this, 'totalDonations', totalDonations);
    RealmObjectBase.set(this, 'totalRequests', totalRequests);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'isVerified', isVerified);
    RealmObjectBase.set(this, 'isEmailVerified', isEmailVerified);
    RealmObjectBase.set(this, 'isMobileVerified', isMobileVerified);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set<RealmList<Review>>(
        this, 'recentReviews', RealmList<Review>(recentReviews));
    RealmObjectBase.set<RealmList<Donation>>(
        this, 'recentDonations', RealmList<Donation>(recentDonations));
    RealmObjectBase.set<RealmList<Donation>>(this, 'recentDonationRequests',
        RealmList<Donation>(recentDonationRequests));
  }

  Profile._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get orgId => RealmObjectBase.get<String>(this, 'orgId') as String;
  @override
  set orgId(String value) => RealmObjectBase.set(this, 'orgId', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'userId') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'userId', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get mobile => RealmObjectBase.get<String>(this, 'mobile') as String;
  @override
  set mobile(String value) => RealmObjectBase.set(this, 'mobile', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get role => RealmObjectBase.get<String>(this, 'role') as String;
  @override
  set role(String value) => RealmObjectBase.set(this, 'role', value);

  @override
  String get imgSrc => RealmObjectBase.get<String>(this, 'imgSrc') as String;
  @override
  set imgSrc(String value) => RealmObjectBase.set(this, 'imgSrc', value);

  @override
  int get rating => RealmObjectBase.get<int>(this, 'rating') as int;
  @override
  set rating(int value) => RealmObjectBase.set(this, 'rating', value);

  @override
  RealmList<Review> get recentReviews =>
      RealmObjectBase.get<Review>(this, 'recentReviews') as RealmList<Review>;
  @override
  set recentReviews(covariant RealmList<Review> value) =>
      throw RealmUnsupportedSetError();

  @override
  Address? get address =>
      RealmObjectBase.get<Address>(this, 'address') as Address?;
  @override
  set address(covariant Address? value) =>
      RealmObjectBase.set(this, 'address', value);

  @override
  Location? get location =>
      RealmObjectBase.get<Location>(this, 'location') as Location?;
  @override
  set location(covariant Location? value) =>
      RealmObjectBase.set(this, 'location', value);

  @override
  String get bloodGroup =>
      RealmObjectBase.get<String>(this, 'bloodGroup') as String;
  @override
  set bloodGroup(String value) =>
      RealmObjectBase.set(this, 'bloodGroup', value);

  @override
  String get availability =>
      RealmObjectBase.get<String>(this, 'availability') as String;
  @override
  set availability(String value) =>
      RealmObjectBase.set(this, 'availability', value);

  @override
  DateTime get lastDonatedAt =>
      RealmObjectBase.get<DateTime>(this, 'lastDonatedAt') as DateTime;
  @override
  set lastDonatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'lastDonatedAt', value);

  @override
  RealmList<Donation> get recentDonations =>
      RealmObjectBase.get<Donation>(this, 'recentDonations')
          as RealmList<Donation>;
  @override
  set recentDonations(covariant RealmList<Donation> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<Donation> get recentDonationRequests =>
      RealmObjectBase.get<Donation>(this, 'recentDonationRequests')
          as RealmList<Donation>;
  @override
  set recentDonationRequests(covariant RealmList<Donation> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get totalDonations =>
      RealmObjectBase.get<int>(this, 'totalDonations') as int;
  @override
  set totalDonations(int value) =>
      RealmObjectBase.set(this, 'totalDonations', value);

  @override
  int get totalRequests =>
      RealmObjectBase.get<int>(this, 'totalRequests') as int;
  @override
  set totalRequests(int value) =>
      RealmObjectBase.set(this, 'totalRequests', value);

  @override
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObjectBase.set(this, 'status', value);

  @override
  bool get isVerified => RealmObjectBase.get<bool>(this, 'isVerified') as bool;
  @override
  set isVerified(bool value) => RealmObjectBase.set(this, 'isVerified', value);

  @override
  bool get isEmailVerified =>
      RealmObjectBase.get<bool>(this, 'isEmailVerified') as bool;
  @override
  set isEmailVerified(bool value) =>
      RealmObjectBase.set(this, 'isEmailVerified', value);

  @override
  bool get isMobileVerified =>
      RealmObjectBase.get<bool>(this, 'isMobileVerified') as bool;
  @override
  set isMobileVerified(bool value) =>
      RealmObjectBase.set(this, 'isMobileVerified', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  Stream<RealmObjectChanges<Profile>> get changes =>
      RealmObjectBase.getChanges<Profile>(this);

  @override
  Profile freeze() => RealmObjectBase.freezeObject<Profile>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Profile._);
    return const SchemaObject(ObjectType.realmObject, Profile, 'Profile', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('orgId', RealmPropertyType.string),
      SchemaProperty('userId', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('mobile', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('role', RealmPropertyType.string),
      SchemaProperty('imgSrc', RealmPropertyType.string),
      SchemaProperty('rating', RealmPropertyType.int),
      SchemaProperty('recentReviews', RealmPropertyType.object,
          linkTarget: 'Review', collectionType: RealmCollectionType.list),
      SchemaProperty('address', RealmPropertyType.object,
          optional: true, linkTarget: 'Address'),
      SchemaProperty('location', RealmPropertyType.object,
          optional: true, linkTarget: 'Location'),
      SchemaProperty('bloodGroup', RealmPropertyType.string),
      SchemaProperty('availability', RealmPropertyType.string),
      SchemaProperty('lastDonatedAt', RealmPropertyType.timestamp),
      SchemaProperty('recentDonations', RealmPropertyType.object,
          linkTarget: 'Donation', collectionType: RealmCollectionType.list),
      SchemaProperty('recentDonationRequests', RealmPropertyType.object,
          linkTarget: 'Donation', collectionType: RealmCollectionType.list),
      SchemaProperty('totalDonations', RealmPropertyType.int),
      SchemaProperty('totalRequests', RealmPropertyType.int),
      SchemaProperty('status', RealmPropertyType.string),
      SchemaProperty('isVerified', RealmPropertyType.bool),
      SchemaProperty('isEmailVerified', RealmPropertyType.bool),
      SchemaProperty('isMobileVerified', RealmPropertyType.bool),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}

class Review extends _Review with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Review(
    ObjectId id,
    String toUserId,
    DateTime updatedAt, {
    double value = 1,
    String desc = '',
    BasicUser? fromUser,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Review>({
        'value': 1,
        'desc': '',
        'createdAt': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'value', value);
    RealmObjectBase.set(this, 'desc', desc);
    RealmObjectBase.set(this, 'toUserId', toUserId);
    RealmObjectBase.set(this, 'fromUser', fromUser);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
  }

  Review._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  double get value => RealmObjectBase.get<double>(this, 'value') as double;
  @override
  set value(double value) => RealmObjectBase.set(this, 'value', value);

  @override
  String get desc => RealmObjectBase.get<String>(this, 'desc') as String;
  @override
  set desc(String value) => RealmObjectBase.set(this, 'desc', value);

  @override
  String get toUserId =>
      RealmObjectBase.get<String>(this, 'toUserId') as String;
  @override
  set toUserId(String value) => RealmObjectBase.set(this, 'toUserId', value);

  @override
  BasicUser? get fromUser =>
      RealmObjectBase.get<BasicUser>(this, 'fromUser') as BasicUser?;
  @override
  set fromUser(covariant BasicUser? value) =>
      RealmObjectBase.set(this, 'fromUser', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  Stream<RealmObjectChanges<Review>> get changes =>
      RealmObjectBase.getChanges<Review>(this);

  @override
  Review freeze() => RealmObjectBase.freezeObject<Review>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Review._);
    return const SchemaObject(ObjectType.realmObject, Review, 'Review', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('value', RealmPropertyType.double),
      SchemaProperty('desc', RealmPropertyType.string),
      SchemaProperty('toUserId', RealmPropertyType.string),
      SchemaProperty('fromUser', RealmPropertyType.object,
          optional: true, linkTarget: 'BasicUser'),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}

class Area extends _Area with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Area({
    String areaId = '',
    String areaName = '',
    int deliveryCost = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Area>({
        'areaId': '',
        'areaName': '',
        'deliveryCost': 0,
      });
    }
    RealmObjectBase.set(this, 'areaId', areaId);
    RealmObjectBase.set(this, 'areaName', areaName);
    RealmObjectBase.set(this, 'deliveryCost', deliveryCost);
  }

  Area._();

  @override
  String get areaId => RealmObjectBase.get<String>(this, 'areaId') as String;
  @override
  set areaId(String value) => RealmObjectBase.set(this, 'areaId', value);

  @override
  String get areaName =>
      RealmObjectBase.get<String>(this, 'areaName') as String;
  @override
  set areaName(String value) => RealmObjectBase.set(this, 'areaName', value);

  @override
  int get deliveryCost => RealmObjectBase.get<int>(this, 'deliveryCost') as int;
  @override
  set deliveryCost(int value) =>
      RealmObjectBase.set(this, 'deliveryCost', value);

  @override
  Stream<RealmObjectChanges<Area>> get changes =>
      RealmObjectBase.getChanges<Area>(this);

  @override
  Area freeze() => RealmObjectBase.freezeObject<Area>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Area._);
    return const SchemaObject(ObjectType.embeddedObject, Area, 'Area', [
      SchemaProperty('areaId', RealmPropertyType.string),
      SchemaProperty('areaName', RealmPropertyType.string),
      SchemaProperty('deliveryCost', RealmPropertyType.int),
    ]);
  }
}

class City extends _City with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  City({
    String cityId = '',
    String cityName = '',
    Iterable<Area> areas = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<City>({
        'cityId': '',
        'cityName': '',
      });
    }
    RealmObjectBase.set(this, 'cityId', cityId);
    RealmObjectBase.set(this, 'cityName', cityName);
    RealmObjectBase.set<RealmList<Area>>(this, 'areas', RealmList<Area>(areas));
  }

  City._();

  @override
  String get cityId => RealmObjectBase.get<String>(this, 'cityId') as String;
  @override
  set cityId(String value) => RealmObjectBase.set(this, 'cityId', value);

  @override
  String get cityName =>
      RealmObjectBase.get<String>(this, 'cityName') as String;
  @override
  set cityName(String value) => RealmObjectBase.set(this, 'cityName', value);

  @override
  RealmList<Area> get areas =>
      RealmObjectBase.get<Area>(this, 'areas') as RealmList<Area>;
  @override
  set areas(covariant RealmList<Area> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<City>> get changes =>
      RealmObjectBase.getChanges<City>(this);

  @override
  City freeze() => RealmObjectBase.freezeObject<City>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(City._);
    return const SchemaObject(ObjectType.embeddedObject, City, 'City', [
      SchemaProperty('cityId', RealmPropertyType.string),
      SchemaProperty('cityName', RealmPropertyType.string),
      SchemaProperty('areas', RealmPropertyType.object,
          linkTarget: 'Area', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Division extends _Division
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Division({
    String divId = '',
    String divName = '',
    Iterable<City> cities = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Division>({
        'divId': '',
        'divName': '',
      });
    }
    RealmObjectBase.set(this, 'divId', divId);
    RealmObjectBase.set(this, 'divName', divName);
    RealmObjectBase.set<RealmList<City>>(
        this, 'cities', RealmList<City>(cities));
  }

  Division._();

  @override
  String get divId => RealmObjectBase.get<String>(this, 'divId') as String;
  @override
  set divId(String value) => RealmObjectBase.set(this, 'divId', value);

  @override
  String get divName => RealmObjectBase.get<String>(this, 'divName') as String;
  @override
  set divName(String value) => RealmObjectBase.set(this, 'divName', value);

  @override
  RealmList<City> get cities =>
      RealmObjectBase.get<City>(this, 'cities') as RealmList<City>;
  @override
  set cities(covariant RealmList<City> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Division>> get changes =>
      RealmObjectBase.getChanges<Division>(this);

  @override
  Division freeze() => RealmObjectBase.freezeObject<Division>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Division._);
    return const SchemaObject(ObjectType.embeddedObject, Division, 'Division', [
      SchemaProperty('divId', RealmPropertyType.string),
      SchemaProperty('divName', RealmPropertyType.string),
      SchemaProperty('cities', RealmPropertyType.object,
          linkTarget: 'City', collectionType: RealmCollectionType.list),
    ]);
  }
}

class AreaData extends _AreaData
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  AreaData(
    ObjectId id,
    DateTime updatedAt, {
    Iterable<Division> divisions = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<AreaData>({
        'createdAt': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set<RealmList<Division>>(
        this, 'divisions', RealmList<Division>(divisions));
  }

  AreaData._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  RealmList<Division> get divisions =>
      RealmObjectBase.get<Division>(this, 'divisions') as RealmList<Division>;
  @override
  set divisions(covariant RealmList<Division> value) =>
      throw RealmUnsupportedSetError();

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  Stream<RealmObjectChanges<AreaData>> get changes =>
      RealmObjectBase.getChanges<AreaData>(this);

  @override
  AreaData freeze() => RealmObjectBase.freezeObject<AreaData>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AreaData._);
    return const SchemaObject(ObjectType.realmObject, AreaData, 'AreaData', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('divisions', RealmPropertyType.object,
          linkTarget: 'Division', collectionType: RealmCollectionType.list),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}
