import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'character_entity.g.dart';

enum CharacterStatus {
  @JsonValue('Alive')
  alive,
  @JsonValue('Dead')
  dead,
  @JsonValue('unknown')
  unknown;

  String get value => toString().split('.').last;
}

enum CharacterGender {
  @JsonValue('Female')
  female,
  @JsonValue('Male')
  male,
  @JsonValue('Genderless')
  genderless,
  unknown;

  String get value => toString().split('.').last;
}

@Collection(accessor: 'characters')
class CharacterEntity {
  Id id = Isar.autoIncrement;
  String name;
  @enumerated
  CharacterStatus status;
  String species;
  String type;
  @enumerated
  CharacterGender gender;
  CharacterOriginEntity origin;
  CharacterLocationEntity location;
  String image;
  List<String> episode;
  String url;
  DateTime created;
  bool isFavorite;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
    this.isFavorite = false,
  });
}

@embedded
class CharacterOriginEntity {
  String name;
  String url;

  CharacterOriginEntity({
    this.name = '',
    this.url = '',
  });
}

@embedded
class CharacterLocationEntity {
  String name;
  String url;

  CharacterLocationEntity({
    this.name = '',
    this.url = '',
  });
}
