import 'package:find_location/domain/repositories/features/service/service_repository.dart';

class DeleteCEPListUseCase {
  final ServiceRepository serviceRepository;

  DeleteCEPListUseCase({
    required this.serviceRepository,
  });

  Future<void> call() async {
    try {
      return await serviceRepository.deleteCEPList();
    } catch (_) {
      rethrow;
    }
  }
}
