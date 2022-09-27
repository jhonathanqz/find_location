import 'package:find_location/domain/entities/city.dart';

abstract class ServiceProvider {
  Future<City?> searchCEP(String cep);
}
