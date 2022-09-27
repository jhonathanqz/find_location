import 'package:mobx/mobx.dart';

import 'package:find_location/domain/use_cases/features/localstorage/add_storage_use_case.dart';
import 'package:find_location/domain/use_cases/features/localstorage/delete_storage_use_case.dart';
import 'package:find_location/domain/use_cases/features/localstorage/get_storage_use_case.dart';
import 'package:find_location/domain/use_cases/features/localstorage/put_storage_use_case.dart';

part 'db.controller.g.dart';

class DbController = DBBase with _$DbController;

abstract class DBBase with Store {
  final AddStorageUseCase addStorageUseCase;
  final DeleteStorageUseCase deleteStorageUseCase;
  final GetStorageUseCase getStorageUseCase;
  final PutStorageUseCase putStorageUseCase;

  DBBase({
    required this.addStorageUseCase,
    required this.deleteStorageUseCase,
    required this.getStorageUseCase,
    required this.putStorageUseCase,
  });

  @observable
  bool isLoading = false;

  @action
  Future<void> insert(String key, List<String> value) async {
    try {
      isLoading = true;
      await addStorageUseCase.call(key, value);
      isLoading = false;
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<void> delete(String key) async {
    try {
      isLoading = true;
      await deleteStorageUseCase.call(key);
      isLoading = false;
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<void> put(String key, List<String> value) async {
    try {
      isLoading = true;
      await putStorageUseCase.call(key, value);
      isLoading = false;
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<List<String>> get(String key) async {
    var list = <String>[];
    try {
      isLoading = true;
      final response = await getStorageUseCase.call(key);
      list = response;
      isLoading = false;
      return list;
    } catch (_) {}
    isLoading = false;
    return list;
  }
}
