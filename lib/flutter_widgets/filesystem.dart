import 'package:path_provider/path_provider.dart';

class FileSystem {
  static Future<String> AppDictoryPath() async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
}
