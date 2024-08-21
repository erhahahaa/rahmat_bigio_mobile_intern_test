import 'package:mockito/annotations.dart';
import 'package:rick_morty/features/features.dart';

@GenerateMocks([
  CharacterRepository,
  EpisodeRepository,
  LocationRepository,
])
void main() {}
