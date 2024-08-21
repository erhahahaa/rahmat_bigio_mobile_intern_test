import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidayatullah/features/features.dart';

part 'episode_model.freezed.dart';
part 'episode_model.g.dart';

@freezed
class EpisodeModel extends EpisodeEntity with _$EpisodeModel {
  const factory EpisodeModel({
    required int id,
    required String name,
    @JsonKey(name: 'air_date') required String airDate,
    required String episode,
    required List<String> characters,
    required String url,
    required DateTime? created,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool isFavorite,
  }) = _EpisodeModel;

  const EpisodeModel._();

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  factory EpisodeModel.fromEntity(EpisodeEntity entity) => EpisodeModel(
        id: entity.id,
        name: entity.name,
        airDate: entity.airDate,
        episode: entity.episode,
        characters: entity.characters,
        url: entity.url,
        created: entity.created,
        isFavorite: entity.isFavorite,
      );

  EpisodeEntity toEntity() => EpisodeEntity(
        id: id,
        name: name,
        airDate: airDate,
        episode: episode,
        characters: characters,
        url: url,
        created: created,
        isFavorite: isFavorite,
      );

  static EpisodeModel fake() {
    return EpisodeModel(
      id: 1,
      name: 'Pilot',
      airDate: 'December 2, 2013',
      episode: 'S01E01',
      characters: ['https://rickandmortyapi.com/api/character/1'],
      url: 'https://rickandmortyapi.com/api/episode/1',
      created: DateTime.now(),
    );
  }
}
