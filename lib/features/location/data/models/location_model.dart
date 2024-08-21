import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidayatullah/features/features.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel extends LocationEntity with _$LocationModel {
  const factory LocationModel({
    required int id,
    required String name,
    required String type,
    required String dimension,
    required List<String> residents,
    required String url,
    required DateTime? created,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool isFavorite,
  }) = _LocationModel;

  const LocationModel._();

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  factory LocationModel.fromEntity(LocationEntity entity) => LocationModel(
        id: entity.id,
        name: entity.name,
        type: entity.type,
        dimension: entity.dimension,
        residents: entity.residents,
        url: entity.url,
        created: entity.created,
        isFavorite: entity.isFavorite,
      );

  LocationEntity toEntity() => LocationEntity(
        id: id,
        name: name,
        type: type,
        dimension: dimension,
        residents: residents,
        url: url,
        created: created,
        isFavorite: isFavorite,
      );

  static LocationModel fake() {
    return LocationModel(
      id: 1,
      name: 'Earth (C-137)',
      type: 'Planet',
      dimension: 'Dimension C-137',
      residents: ['https://rickandmortyapi.com/api/character/1'],
      url: 'https://rickandmortyapi.com/api/location/1',
      created: DateTime.now(),
    );
  }
}
