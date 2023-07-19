// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

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
    ObjectId id, {
    required updatedAt,
    Iterable<Division> divisions = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<AreaData>({
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
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
