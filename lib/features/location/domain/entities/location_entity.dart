import 'package:isar/isar.dart';

part 'location_entity.g.dart';

@Collection(accessor: 'locations')
class LocationEntity {
  Id id = Isar.autoIncrement;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  DateTime created;

  LocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
}
