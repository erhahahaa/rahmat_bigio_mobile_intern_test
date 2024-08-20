import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@singleton
class IsarClient with Log {
  late final Isar instance;

  IsarClient() {
    init();
  }

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    instance = Isar.getInstance() ?? await _createIsar();
  }

  @disposeMethod
  void dispose() {
    instance.close();
  }

  Future<Isar> _createIsar() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          CharacterEntitySchema,
          EpisodeEntitySchema,
          LocationEntitySchema,
        ],
        inspector: kDebugMode,
        directory: dir.path,
      );
    } catch (e) {
      Log.error('Error creating Isar: $e');
      rethrow;
    }
  }
}
