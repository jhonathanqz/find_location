import 'package:mobx/mobx.dart';

import 'package:find_location/src/provider/localstorage_provider.dart';

part 'db.controller.g.dart';

class DbController = DBBase with _$DbController;

abstract class DBBase with Store {
  final LocalStorageProvider localStorageProvider;

  DBBase({
    required this.localStorageProvider,
  });

  @observable
  bool isLoading = false;

  @action
  Future<void> insert(String key, List<String> value) async {
    try {
      isLoading = true;
      await localStorageProvider.add(key, value);
      isLoading = false;
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<void> delete(String key) async {
    try {
      isLoading = true;
      await localStorageProvider.delete(key);
      isLoading = false;
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<void> put(String key, List<String> value) async {
    try {
      isLoading = true;
      await localStorageProvider.put(key, value);
      isLoading = false;
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<List<String>> get(String key) async {
    var list = <String>[];
    try {
      isLoading = true;
      final response = await localStorageProvider.get(key);
      list = response;
      isLoading = false;
      return list;
    } catch (_) {}
    isLoading = false;
    return list;
  }
}
