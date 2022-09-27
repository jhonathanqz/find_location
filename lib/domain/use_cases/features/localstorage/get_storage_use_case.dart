import 'package:find_location/domain/repositories/features/localstorage/database_repository.dart';

class GetStorageUseCase {
  final DataBaseRepository dataBaseRepository;

  GetStorageUseCase({
    required this.dataBaseRepository,
  });

  Future<List<String>> call(String key) async {
    try {
      return await dataBaseRepository.get(key);
    } catch (_) {
      rethrow;
    }
  }
}
