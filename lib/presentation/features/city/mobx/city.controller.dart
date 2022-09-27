import 'package:mobx/mobx.dart';

import 'package:find_location/domain/entities/city.dart';
import 'package:find_location/domain/use_cases/features/service/delete_cep_list_use_case.dart';
import 'package:find_location/domain/use_cases/features/service/get_cep_list_use_case.dart';
import 'package:find_location/domain/use_cases/features/service/save_cep_list_use_case.dart';
import 'package:find_location/domain/use_cases/features/service/search_cep_use_case.dart';

part 'city.controller.g.dart';

class CityController = CityBase with _$CityController;

abstract class CityBase with Store {
  final SearchCEPUseCase searchCEPUseCase;
  final SaveCEPListUseCase saveCEPListUseCase;
  final GetCEPListUseCase getCEPListUseCase;
  final DeleteCEPListUseCase deleteCEPListUseCase;

  CityBase({
    required this.searchCEPUseCase,
    required this.saveCEPListUseCase,
    required this.getCEPListUseCase,
    required this.deleteCEPListUseCase,
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
      await saveCEPListUseCase.call(cepList);
      isLoading = false;
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<void> getCepList() async {
    try {
      wipeError();
      isLoading = true;

      final _response = await getCEPListUseCase.call();

      if (_response != null) {
        cepList = _response;
      }
      isLoading = false;
    } catch (_) {
      isError = true;
      errorMessage = 'Erro ao tentar obter histórico de consultas';
    }
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
  Future<void> deleteCEPList() async {
    try {
      wipeError();
      isLoading = true;
      await deleteCEPListUseCase.call();
      wipe();
      isLoading = false;
    } catch (_) {
      isError = true;
      errorMessage = 'Erro ao tentar excluir histórico de consultas';
    }
    isLoading = false;
  }

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

  @action
  void wipeError() {
    isError = false;
    errorMessage = '';
  }
}
