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
  final Id id;
  final String name;
  @enumerated
  final CharacterStatus status;
  final String species;
  final String type;
  @enumerated
  final CharacterGender gender;
  final CharacterOriginEntity origin;
  final CharacterLocationEntity location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime? created;
  final bool isFavorite;

  const CharacterEntity({
    this.id = Isar.autoIncrement,
    this.name = '',
    this.status = CharacterStatus.unknown,
    this.species = '',
    this.type = '',
    this.gender = CharacterGender.unknown,
    this.origin = const CharacterOriginEntity(),
    this.location = const CharacterLocationEntity(),
    this.image = '',
    this.episode = const [],
    this.url = '',
    this.created,
    this.isFavorite = false,
  });
}

@embedded
class CharacterOriginEntity {
  final String name;
  final String url;

  const CharacterOriginEntity({
    this.name = '',
    this.url = '',
  });
}

@embedded
class CharacterLocationEntity {
  final String name;
  final String url;

  const CharacterLocationEntity({
    this.name = '',
    this.url = '',
  });
}
