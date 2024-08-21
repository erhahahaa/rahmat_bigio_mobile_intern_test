import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class IsarClient with Log {
  late final Isar instance;
  bool? isUnitTest;

  IsarClient(this.isUnitTest);

  @PostConstruct(preResolve: true)
  Future<Isar> init() async {
    instance = Isar.getInstance() ?? await _createIsar();
    return instance;
  }

  Future<Isar> _createIsar() async {
    try {
      String path;
      if (isUnitTest == true) {
        final dir = await getTemporaryDirectory();
        path = dir.path;
      } else {
        final dir = await getApplicationDocumentsDirectory();
        path = dir.path;
      }
      return await Isar.open(
        [
          CharacterEntitySchema,
          EpisodeEntitySchema,
          LocationEntitySchema,
        ],
        inspector: kDebugMode,
        directory: path,
      );
    } catch (e) {
      final dir = Directory.current;
      final path = dir.path;
      Log.failure('IS unit test $isUnitTest');
      Log.error('dir: $path');
      Log.error('Error creating Isar: $e');
      rethrow;
    }
  }
}
