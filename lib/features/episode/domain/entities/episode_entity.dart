import 'package:isar/isar.dart';

part 'episode_entity.g.dart';

@Collection(accessor: 'episodes')
class EpisodeEntity {
  Id id = Isar.autoIncrement;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  DateTime created;

  EpisodeEntity({
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });
}
