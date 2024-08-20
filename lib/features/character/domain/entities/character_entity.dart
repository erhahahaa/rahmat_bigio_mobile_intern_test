import 'package:isar/isar.dart';

part 'character_entity.g.dart';

enum CharacterStatus {
  alive,
  dead,
  unknown;

  static CharacterStatus fromString(String status) {
    switch (status) {
      case 'Alive':
        return CharacterStatus.alive;
      case 'Dead':
        return CharacterStatus.dead;
      case 'unknown':
      default:
        return CharacterStatus.unknown;
    }
  }
}

enum CharacterGender {
  female,
  male,
  genderless,
  unknown;

  static CharacterGender fromString(String status) {
    switch (status) {
      case 'Female':
        return CharacterGender.female;
      case 'Male':
        return CharacterGender.male;
      case 'Genderless':
        return CharacterGender.genderless;
      case 'unknown':
      default:
        return CharacterGender.unknown;
    }
  }
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

  CharacterEntity({
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
