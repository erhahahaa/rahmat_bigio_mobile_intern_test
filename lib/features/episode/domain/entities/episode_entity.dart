import 'package:isar/isar.dart';

part 'episode_entity.g.dart';

@Collection(accessor: 'episodes')
class EpisodeEntity {
  final Id id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime? created;
  final bool isFavorite;

  const EpisodeEntity({
    this.id = Isar.autoIncrement,
    this.name = '',
    this.airDate = '',
    this.episode = '',
    this.characters = const [],
    this.url = '',
    this.created,
    this.isFavorite = false,
  });
}
