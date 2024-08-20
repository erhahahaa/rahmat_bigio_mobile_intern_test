import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_morty/features/features.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
abstract class LocationModel with _$LocationModel {
  const factory LocationModel({
    required int id,
    required String name,
    required String type,
    required String dimension,
    required List<String> residents,
    required String url,
    required DateTime created,
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
      );

  LocationEntity toEntity() => LocationEntity(
        id: id,
        name: name,
        type: type,
        dimension: dimension,
        residents: residents,
        url: url,
        created: created,
      );
}
