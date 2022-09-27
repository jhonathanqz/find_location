import 'package:find_location/domain/repositories/features/localstorage/database_repository.dart';

class DeleteStorageUseCase {
  final DataBaseRepository dataBaseRepository;

  DeleteStorageUseCase({
    required this.dataBaseRepository,
  });

  Future<void> call(String key) async {
    try {
      await dataBaseRepository.delete(key);
    } catch (_) {
      rethrow;
    }
  }
}
