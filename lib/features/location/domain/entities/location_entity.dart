import 'package:isar/isar.dart';

part 'location_entity.g.dart';

@Collection(accessor: 'locations')
class LocationEntity {
  final Id id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime? created;
  final bool isFavorite;

  const LocationEntity({
    this.id = Isar.autoIncrement,
    this.name = '',
    this.type = '',
    this.dimension = '',
    this.residents = const [],
    this.url = '',
    this.created,
    this.isFavorite = false,
  });
}
