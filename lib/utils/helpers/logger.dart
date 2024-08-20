import 'package:logger/logger.dart';

final _log = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

mixin class Log {
  static void debug(String message) => _log.d(message);
  static void error(String message) => _log.e(message);
  static void failure(String message) => _log.f(message);
  static void info(String message) => _log.i(message);
  static void warning(String message) => _log.w(message);
  static void trace(String message) => _log.t(message);
}
