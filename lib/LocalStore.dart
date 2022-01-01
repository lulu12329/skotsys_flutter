import 'dart:convert';
import 'dart:io';
import 'package:kotsys_flutter/Session.dart';
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

  static Future<File> writeUser() async {
    final file = await _localFile;
    String jsonString = json.encode(Session().toJson());
    return file.writeAsString(jsonString);
  }

  static Future<String> readUser() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    } catch (e) {
      return "";
    }
  }

  static void deleteuUser() async {
    final file = await _localFile;
    file.delete();
  }
}
