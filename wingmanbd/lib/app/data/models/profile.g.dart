// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Address extends _Address
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Address({
    String name = '',
    String mobile = '',
    String division = '',
    String city = '',
    String area = '',
    String addressLine = '',
    String label = '',
    bool isDefault = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Address>({
        'name': '',
        'mobile': '',
        'division': '',
        'city': '',
        'area': '',
        'addressLine': '',
        'label': '',
        'isDefault': false,
      });
    }
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'mobile', mobile);
    RealmObjectBase.set(this, 'division', division);
    RealmObjectBase.set(this, 'city', city);
    RealmObjectBase.set(this, 'area', area);
    RealmObjectBase.set(this, 'addressLine', addressLine);
    RealmObjectBase.set(this, 'label', label);
    RealmObjectBase.set(this, 'isDefault', isDefault);
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
  bool get isDefault => RealmObjectBase.get<bool>(this, 'isDefault') as bool;
  @override
  set isDefault(bool value) => RealmObjectBase.set(this, 'isDefault', value);

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
      SchemaProperty('isDefault', RealmPropertyType.bool),
    ]);
  }
}

class Profile extends _Profile with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Profile(
    ObjectId id,
    String userId, {
    String name = '',
    String mobile = '',
    String email = '',
    String img = '',
    String role = UserRole.USER,
    String status = UserStatus.ACTIVE,
    String deactivationReason = '',
    bool isEmailVerified = false,
    bool isMobileVerified = false,
    bool isVerified = false,
    required DateTime updatedAt,
    Iterable<Address> addressBook = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Profile>({
        'name': '',
        'mobile': '',
        'email': '',
        'img': '',
        'role': UserRole.USER,
        'status': UserStatus.ACTIVE,
        'deactivationReason': '',
        'isEmailVerified': false,
        'isMobileVerified': false,
        'isVerified': false,
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'mobile', mobile);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'img', img);
    RealmObjectBase.set(this, 'role', role);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'deactivationReason', deactivationReason);
    RealmObjectBase.set(this, 'isEmailVerified', isEmailVerified);
    RealmObjectBase.set(this, 'isMobileVerified', isMobileVerified);
    RealmObjectBase.set(this, 'isVerified', isVerified);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set<RealmList<Address>>(
        this, 'addressBook', RealmList<Address>(addressBook));
  }

  Profile._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

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
  String get img => RealmObjectBase.get<String>(this, 'img') as String;
  @override
  set img(String value) => RealmObjectBase.set(this, 'img', value);

  @override
  String get role => RealmObjectBase.get<String>(this, 'role') as String;
  @override
  set role(String value) => RealmObjectBase.set(this, 'role', value);

  @override
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObjectBase.set(this, 'status', value);

  @override
  String get deactivationReason =>
      RealmObjectBase.get<String>(this, 'deactivationReason') as String;
  @override
  set deactivationReason(String value) =>
      RealmObjectBase.set(this, 'deactivationReason', value);

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
  bool get isVerified => RealmObjectBase.get<bool>(this, 'isVerified') as bool;
  @override
  set isVerified(bool value) => RealmObjectBase.set(this, 'isVerified', value);

  @override
  RealmList<Address> get addressBook =>
      RealmObjectBase.get<Address>(this, 'addressBook') as RealmList<Address>;
  @override
  set addressBook(covariant RealmList<Address> value) =>
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
      SchemaProperty('userId', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('mobile', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('email', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('img', RealmPropertyType.string),
      SchemaProperty('role', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('status', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('deactivationReason', RealmPropertyType.string),
      SchemaProperty('isEmailVerified', RealmPropertyType.bool),
      SchemaProperty('isMobileVerified', RealmPropertyType.bool),
      SchemaProperty('isVerified', RealmPropertyType.bool),
      SchemaProperty('addressBook', RealmPropertyType.object,
          linkTarget: 'Address', collectionType: RealmCollectionType.list),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}
