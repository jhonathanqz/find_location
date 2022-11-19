//SitefSettings
import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageProvider {
  final Completer<Box> _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox("db_casei_bem");
    _instance.complete(box);
  }

  LocalStorageProvider() {
    _init();
  }

  Future<List<String>> get(String key) async {
    try {
      var box = await _instance.future;
      var response = await box.get(key);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> put(String key, List<String> value) async {
    try {
      var box = await _instance.future;
      await box.put(key, value);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> add(String key, List<String> value) async {
    try {
      var box = await _instance.future;
      await box.put(key, value);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String key) async {
    try {
      var box = await _instance.future;
      await box.delete(key);
    } catch (e) {
      rethrow;
    }
  }
}
