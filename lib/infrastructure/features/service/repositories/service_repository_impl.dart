import 'package:find_location/domain/entities/city.dart';
import 'package:find_location/domain/repositories/features/service/service_repository.dart';
import 'package:find_location/infrastructure/features/service/repositories/contracts/service_provider.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceProvider serviceProvider;

  ServiceRepositoryImpl({
    required this.serviceProvider,
  });

  @override
  Future<City?> searchCEP(String cep) async {
    try {
      return await serviceProvider.searchCEP(cep);
    } catch (_) {
      rethrow;
    }
  }
}
