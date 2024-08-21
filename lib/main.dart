import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:rick_morty/app/app.dart';
import 'package:rick_morty/app/sl.dart';
import 'package:rick_morty/utils/utils.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Isar.initializeIsarCore();
    await configureDependencies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      runApp(RickMortyApp());
    });
  }, (error, stackTrace) async {
    Log.error(error.toString());
    Log.trace(stackTrace.toString());
  });
}
