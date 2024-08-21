import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidayatullah/app/app.dart';
import 'package:hidayatullah/app/sl.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:isar/isar.dart';

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
