// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterModelImpl _$$CharacterModelImplFromJson(Map<String, dynamic> json) =>
    _$CharacterModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: $enumDecode(_$CharacterStatusEnumMap, json['status']),
      species: json['species'] as String,
      type: json['type'] as String,
      gender: $enumDecode(_$CharacterGenderEnumMap, json['gender']),
      origin:
          CharacterOriginModel.fromJson(json['origin'] as Map<String, dynamic>),
      location: CharacterLocationModel.fromJson(
          json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$CharacterModelImplToJson(
        _$CharacterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$CharacterStatusEnumMap[instance.status]!,
      'species': instance.species,
      'type': instance.type,
      'gender': _$CharacterGenderEnumMap[instance.gender]!,
      'origin': instance.origin.toJson(),
      'location': instance.location.toJson(),
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
    };

const _$CharacterStatusEnumMap = {
  CharacterStatus.alive: 'Alive',
  CharacterStatus.dead: 'Dead',
  CharacterStatus.unknown: 'unknown',
};

const _$CharacterGenderEnumMap = {
  CharacterGender.female: 'Female',
  CharacterGender.male: 'Male',
  CharacterGender.genderless: 'Genderless',
  CharacterGender.unknown: 'unknown',
};

_$CharacterOriginModelImpl _$$CharacterOriginModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterOriginModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$CharacterOriginModelImplToJson(
        _$CharacterOriginModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$CharacterLocationModelImpl _$$CharacterLocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterLocationModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$CharacterLocationModelImplToJson(
        _$CharacterLocationModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
