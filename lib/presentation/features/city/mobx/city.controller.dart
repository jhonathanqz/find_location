import 'package:mobx/mobx.dart';

import 'package:find_location/app/injection_container.dart';
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
  List<String> cepList = [];

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
      await saveCEP(cepController);
      city = _result;
    } catch (e) {
      isError = true;
      errorMessage = 'Erro ao realizar busca do CEP: $cepController';
    }
    isLoading = false;
  }

  @action
  Future<void> saveCEP(String cep) async {
    try {
      isLoading = true;
      if (!cepList.contains(cep)) {
        cepList.add(cep);
      }
      sl<DbController>().put('cep_key', cepList);
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<void> getCepList() async {
    try {
      isLoading = true;

      cepList = await sl<DbController>().get('cep_key');
    } catch (_) {}
    isLoading = false;
  }

  @observable
  List<String> cepsFilter = [];

  @observable
  String filter = '';

  @action
  void setFilter(String value) {
    filter = value;
    cepsFilter = cepList
        .where((e) => e.toLowerCase().contains(value.toLowerCase()))
        .toList();
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
}
