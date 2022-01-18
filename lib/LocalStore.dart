import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:kotsys_flutter/Session.dart';
import 'package:path_provider/path_provider.dart';

class LocalStore {
  static Future<String> _localPath() async {
    if (kIsWeb) {
      throw new Exception("running on web");
    }
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath();
    return File('$path/token.txt');
  }

  static writeUser() async {
    try {
      final file = await _localFile;
      String jsonString = json.encode(Session().toJson());
      return file.writeAsString(jsonString);
    } catch (_) {}
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
    try {
      final file = await _localFile;
      file.delete();
    } catch (_) {}
  }
}
