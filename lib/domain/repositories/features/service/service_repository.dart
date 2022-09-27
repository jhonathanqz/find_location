import 'package:find_location/domain/entities/city.dart';

abstract class ServiceRepository {
  Future<City?> searchCEP(String cep);
}
