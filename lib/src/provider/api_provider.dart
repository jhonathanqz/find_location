import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:find_location/src/controller/db.controller.dart';
import 'package:find_location/src/model/banco_de_dados/city_model_response.dart';
import 'package:find_location/src/model/banco_de_dados/save_city_model.dart';
import 'package:find_location/src/model/cidade.dart';

class ApiProvider {
  final DbController dbController;
  final Dio http;

  ApiProvider({
    required this.dbController,
    required this.http,
  });

  Future<Cidade?> searchCEP(String cep) async {
    try {
      final _response = await http.get('https://viacep.com.br/ws/$cep/json/');

      final _model = CityModelResponse.fromJson(_response.data);
      return Cidade(
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

  Future<List<Cidade>?> getCEPList() async {
    List<Cidade> _cityList = [];
    try {
      final _response = await dbController.get('cep_key');

      if (_response.isNotEmpty) {
        final _citiesModel =
            SaveCityModel.fromJson(jsonDecode(_response.first));

        final _buildList = _citiesModel.citiesList
            .map(
              (e) => Cidade(
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

  Future<void> saveCEPList(List<Cidade> cities) async {
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

  Future<void> deleteCEPList() async {
    try {
      await dbController.delete('cep_key');
    } catch (_) {}
  }
}
