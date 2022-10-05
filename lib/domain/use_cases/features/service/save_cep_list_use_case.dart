import 'package:find_location/domain/entities/city.dart';
import 'package:find_location/domain/repositories/features/service/service_repository.dart';

class SaveCEPListUseCase {
  final ServiceRepository serviceRepository;

  SaveCEPListUseCase({
    required this.serviceRepository,
  });

  Future<void> call(List<City> cities) async {
    try {
      return await serviceRepository.saveCEPList(cities);
    } catch (_) {
      rethrow;
    }
  }
}
