import 'package:realm/realm.dart';

part 'area.g.dart';

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
  DateTime updatedAt = DateTime.now();
}
