import 'package:dio/dio.dart';

import 'package:find_location/data/features/service/model/city_model_response.dart';
import 'package:find_location/domain/entities/city.dart';
import 'package:find_location/infrastructure/features/service/repositories/contracts/service_provider.dart';
import 'package:find_location/presentation/features/localstorage/mobx/db.controller.dart';

class ServiceProviderImpl implements ServiceProvider {
  final DbController dbController;
  final Dio client;

  ServiceProviderImpl({
    required this.dbController,
    required this.client,
  });

  @override
  Future<City?> searchCEP(String cep) async {
    try {
      final _response = await client.get('https://viacep.com.br/ws/$cep/json/');

      final _model = CityModelResponse.fromJson(_response.data);
      return City(
        zipcode: _model.cep ?? '',
        publicPlace: _model.logradouro ?? '',
        complement: _model.complemento ?? '',
        district: _model.bairro ?? '',
        city: _model.localidade ?? '',
        uf: _model.uf ?? '',
        ibge: _model.ibge ?? '',
        ddd: _model.ddd ?? '',
      );
    } catch (e) {
      return null;
    }
  }
}
