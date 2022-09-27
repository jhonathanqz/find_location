import 'package:find_location/domain/entities/city.dart';

abstract class ServiceProvider {
  Future<City?> searchCEP(String cep);

  Future<void> saveCEPList(List<City> cities);

  Future<List<City>?> getCEPList();
}
