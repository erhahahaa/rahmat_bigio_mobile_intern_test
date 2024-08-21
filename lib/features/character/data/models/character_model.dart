import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidayatullah/features/character/domain/entities/character_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class CharacterModel extends CharacterEntity with _$CharacterModel {
  const factory CharacterModel({
    required int id,
    required String name,
    required CharacterStatus status,
    required String species,
    required String type,
    required CharacterGender gender,
    required CharacterOriginModel origin,
    required CharacterLocationModel location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime? created,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool isFavorite,
  }) = _CharacterModel;

  const CharacterModel._();

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  factory CharacterModel.fromEntity(CharacterEntity entity) => CharacterModel(
        id: entity.id,
        name: entity.name,
        status: entity.status,
        species: entity.species,
        type: entity.type,
        gender: entity.gender,
        origin: CharacterOriginModel.fromEntity(entity.origin),
        location: CharacterLocationModel.fromEntity(entity.location),
        image: entity.image,
        episode: entity.episode,
        url: entity.url,
        created: entity.created,
        isFavorite: entity.isFavorite,
      );

  CharacterEntity toEntity() => CharacterEntity(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        origin: origin.toEntity(),
        location: location.toEntity(),
        image: image,
        episode: episode,
        url: url,
        created: created,
        isFavorite: isFavorite,
      );

  static CharacterModel fake() {
    return CharacterModel(
      id: Random().nextInt(100),
      name: BoneMock.name,
      status: CharacterStatus.alive,
      species: BoneMock.subtitle,
      type: BoneMock.subtitle,
      gender: CharacterGender.unknown,
      origin: CharacterOriginModel(
        name: BoneMock.name,
        url: CharacterOriginEntity.URL_FALLBACK,
      ),
      location: CharacterLocationModel(
        name: BoneMock.name,
        url: CharacterLocationEntity.URL_FALLBACK,
      ),
      image: CharacterEntity.IMAGE_FALLBACK,
      episode: List.generate(5, (index) => BoneMock.name),
      url: CharacterEntity.URL_FALLBACK,
      created: DateTime.now(),
    );
  }
}

@freezed
class CharacterOriginModel extends CharacterOriginEntity
    with _$CharacterOriginModel {
  const factory CharacterOriginModel({
    required String name,
    required String url,
  }) = _CharacterOriginModel;

  const CharacterOriginModel._();

  factory CharacterOriginModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterOriginModelFromJson(json);

  factory CharacterOriginModel.fromEntity(CharacterOriginEntity entity) =>
      CharacterOriginModel(
        name: entity.name,
        url: entity.url,
      );

  CharacterOriginEntity toEntity() => CharacterOriginEntity(
        name: name,
        url: url,
      );
}

@freezed
class CharacterLocationModel extends CharacterLocationEntity
    with _$CharacterLocationModel {
  const factory CharacterLocationModel({
    required String name,
    required String url,
  }) = _CharacterLocationModel;

  const CharacterLocationModel._();

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationModelFromJson(json);

  factory CharacterLocationModel.fromEntity(CharacterLocationEntity entity) =>
      CharacterLocationModel(
        name: entity.name,
        url: entity.url,
      );

  CharacterLocationEntity toEntity() => CharacterLocationEntity(
        name: name,
        url: url,
      );
}
