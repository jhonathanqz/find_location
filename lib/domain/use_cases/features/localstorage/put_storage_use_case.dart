import 'package:find_location/domain/repositories/features/localstorage/database_repository.dart';

class PutStorageUseCase {
  final DataBaseRepository dataBaseRepository;

  PutStorageUseCase({
    required this.dataBaseRepository,
  });

  Future<void> call(String key, List<String> value) async {
    try {
      await dataBaseRepository.put(key, value);
    } catch (_) {
      rethrow;
    }
  }
}
