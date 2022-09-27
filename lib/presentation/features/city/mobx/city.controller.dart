import 'dart:convert';

import 'package:mobx/mobx.dart';

import 'package:find_location/app/injection_container.dart';
import 'package:find_location/data/features/service/model/city_model_response.dart';
import 'package:find_location/data/features/service/model/save_city_model.dart';
import 'package:find_location/domain/entities/city.dart';
import 'package:find_location/domain/use_cases/features/service/search_cep_use_case.dart';
import 'package:find_location/presentation/features/localstorage/mobx/db.controller.dart';

part 'city.controller.g.dart';

class CityController = CityBase with _$CityController;

abstract class CityBase with Store {
  final SearchCEPUseCase searchCEPUseCase;

  CityBase({
    required this.searchCEPUseCase,
  });

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String errorMessage = '';

  @observable
  City? city;

  @observable
  String cepController = '';

  @action
  void setCep(String value) => cepController = value;

  @observable
  List<City> cepList = [];

  @action
  Future<void> searchCEP() async {
    //wipe();
    isError = false;
    errorMessage = '';
    if (cepController.trim() == '') {
      isError = true;
      errorMessage = 'CEP inválido';
      return;
    }
    try {
      isLoading = true;
      final _result = await searchCEPUseCase.call(cepController);
      if (_result == null) {
        isError = true;
        errorMessage =
            'Não foi possível encontrar informação para o CEP: $cepController';
        city = null;
        isLoading = false;
        return;
      }
      await saveCEP(_result);
      city = _result;
    } catch (e) {
      isError = true;
      errorMessage = 'Erro ao realizar busca do CEP: $cepController';
    }
    isLoading = false;
  }

  @action
  Future<void> saveCEP(City cep) async {
    try {
      isLoading = true;
      await getCepList();
      if (!cepList.contains(cep)) {
        cepList.add(cep);
      }
      List<CityModelResponse> _citiesModel = [];
      for (var e in cepList) {
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

      await sl<DbController>().put('cep_key', [jsonEncode(_save.toJson())]);
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<void> getCepList() async {
    try {
      isLoading = true;

      final _response = await sl<DbController>().get('cep_key');

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

        cepList = _buildList;
        isLoading = false;
        return;
      }
    } catch (_) {}
    isLoading = false;
  }

  @observable
  List<City> cepsFilter = [];

  @observable
  String filter = '';

  @action
  void setFilter(String value) {
    filter = value;
    if (isFilterName) {
      cepsFilter = cepList
          .where(
              (e) => e.publicPlace.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      cepsFilter = cepList
          .where((e) => e.zipcode.contains(value.toLowerCase()))
          .toList();
    }
  }

  @observable
  bool isFilterName = false;

  @action
  void wipe() {
    isLoading = false;
    isError = false;
    errorMessage = '';
    cepController = '';
    cepList = [];
    cepsFilter = [];
    filter = '';
    city = null;
  }
}
