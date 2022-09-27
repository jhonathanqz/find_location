import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:find_location/data/features/service/model/city_model_response.dart';
import 'package:find_location/data/features/service/model/save_city_model.dart';
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

  @override
  Future<List<City>?> getCEPList() async {
    List<City> _cityList = [];
    try {
      final _response = await dbController.get('cep_key');

      if (_response.isNotEmpty) {
        final _citiesModel =
            SaveCityModel.fromJson(jsonDecode(_response.first));

        final _buildList = _citiesModel.citiesList
            .map(
              (e) => City(
                zipcode: e.cep ?? '',
                publicPlace: e.logradouro ?? '',
                complement: e.complemento ?? '',
                district: e.bairro ?? '',
                city: e.localidade ?? '',
                uf: e.uf ?? '',
                ibge: e.ibge ?? '',
                ddd: e.ddd ?? '',
              ),
            )
            .toList();

        _cityList = _buildList;
        return _cityList;
      }
    } catch (_) {}
    return _cityList;
  }

  @override
  Future<void> saveCEPList(List<City> cities) async {
    try {
      List<CityModelResponse> _citiesModel = [];
      for (var e in cities) {
        final _model = CityModelResponse(
          cep: e.zipcode,
          logradouro: e.publicPlace,
          complemento: e.complement,
          bairro: e.district,
          localidade: e.city,
          uf: e.uf,
          ibge: e.ibge,
          ddd: e.ddd,
        );

        _citiesModel.add(_model);
      }

      final _save = SaveCityModel(
        citiesList: _citiesModel,
      );

      await dbController.put('cep_key', [jsonEncode(_save.toJson())]);
    } catch (_) {}
  }
}
