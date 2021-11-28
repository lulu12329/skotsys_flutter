import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalStore {
  static Future<String> _localPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath();
    return File('$path/token.txt');
  }

  static Future<File> writeUser(String username, token) async {
    final file = await _localFile;
    //TODO store username and token
    return file.writeAsString(username);
  }

  static Future<String> readUser() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    } catch (e) {
      return "";
    }
  }
}
