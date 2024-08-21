import 'package:path_provider/path_provider.dart';

void test() async {
  final dir = await getTemporaryDirectory();
  print(dir.path);
}

void main() {
  test();
}
