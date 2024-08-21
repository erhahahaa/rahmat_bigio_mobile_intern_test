import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/app/sl.config.dart';

final sl = GetIt.instance;

bool _isUnitTest = false;

@module
abstract class AppModule {
  @singleton
  bool get isUnitTest => _isUnitTest;
}

@InjectableInit(
  initializerName: r'init',
  preferRelativeImports: true,
  throwOnMissingDependencies: true,
  asExtension: true,
)
configureDependencies({bool isUnitTest = false}) async {
  _isUnitTest = isUnitTest;
  await sl.init();
}
