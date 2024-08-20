import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/app/sl.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'init',
  preferRelativeImports: true,
  throwOnMissingDependencies: true,
)
Future<void> configureDependencies() async => await sl.init();
