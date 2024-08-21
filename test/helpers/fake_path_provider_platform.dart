import 'package:flutter_test/flutter_test.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class FakePathProvider extends PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return '/tmp';
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return '/documents';
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return '/support';
  }

  @override
  Future<String?> getDownloadsPath() async {
    return '/downloads';
  }

  @override
  Future<String?> getLibraryPath() async {
    return '/library';
  }
}
