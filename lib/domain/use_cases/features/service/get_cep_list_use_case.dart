import 'package:find_location/domain/entities/city.dart';
import 'package:find_location/domain/repositories/features/service/service_repository.dart';

class GetCEPListUseCase {
  final ServiceRepository serviceRepository;

  GetCEPListUseCase({
    required this.serviceRepository,
  });

  Future<List<City>?> call() async {
    try {
      return await serviceRepository.getCEPList();
    } catch (_) {
      rethrow;
    }
  }
}
