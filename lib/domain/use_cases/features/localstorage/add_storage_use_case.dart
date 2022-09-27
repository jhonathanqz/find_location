import 'package:find_location/domain/repositories/features/localstorage/database_repository.dart';

class AddStorageUseCase {
  final DataBaseRepository dataBaseRepository;

  AddStorageUseCase({
    required this.dataBaseRepository,
  });

  Future<void> call(String key, List<String> value) async {
    try {
      await dataBaseRepository.add(key, value);
    } catch (_) {
      rethrow;
    }
  }
}
