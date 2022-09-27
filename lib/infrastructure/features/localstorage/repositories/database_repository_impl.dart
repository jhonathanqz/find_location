import 'package:find_location/domain/repositories/features/localstorage/database_repository.dart';
import 'package:find_location/infrastructure/features/localstorage/repositories/contracts/database_provider.dart';

class DataBaseRepositoryImpl implements DataBaseRepository {
  final DataBaseProvider dataBaseProvider;

  DataBaseRepositoryImpl({
    required this.dataBaseProvider,
  });

  @override
  Future<List<String>> get(String key) async {
    try {
      return await dataBaseProvider.get(key);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> put(String key, List<String> value) async {
    try {
      return await dataBaseProvider.put(key, value);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      return await dataBaseProvider.delete(key);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> add(String key, List<String> value) async {
    try {
      return await dataBaseProvider.add(key, value);
    } catch (_) {
      rethrow;
    }
  }
}
