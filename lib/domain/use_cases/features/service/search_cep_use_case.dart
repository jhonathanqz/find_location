import 'package:find_location/domain/entities/city.dart';
import 'package:find_location/domain/repositories/features/service/service_repository.dart';

class SearchCEPUseCase {
  final ServiceRepository serviceRepository;

  SearchCEPUseCase({
    required this.serviceRepository,
  });

  Future<City?> call(String cep) async {
    try {
      return await serviceRepository.searchCEP(cep);
    } catch (_) {
      rethrow;
    }
  }
}
