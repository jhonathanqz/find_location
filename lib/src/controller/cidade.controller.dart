import 'package:flutter/cupertino.dart';

import 'package:mobx/mobx.dart';

import 'package:find_location/src/model/cidade.dart';
import 'package:find_location/src/provider/api_provider.dart';
import 'package:find_location/src/shared/helpers/snack_helper.dart';
import 'package:find_location/src/shared/style/app_colors.dart';

part 'cidade.controller.g.dart';

class CidadeController = CidadeBase with _$CidadeController;

abstract class CidadeBase with Store {
  final ApiProvider apiProvider;

  CidadeBase({
    required this.apiProvider,
  });

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String errorMessage = '';

  @observable
  Cidade? cidade;

  @observable
  String cepController = '';

  @action
  void setCep(String value) => cepController = value;

  @observable
  List<Cidade> cepList = [];

  @action
  Future<void> searchCEP(BuildContext context) async {
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
      final _result = await apiProvider.searchCEP(cepController);
      if (_result == null) {
        isError = true;
        errorMessage =
            'Não foi possível encontrar informação para o CEP: $cepController';
        cidade = null;
        isLoading = false;
        return;
      }
      await saveCEP(_result);
      SnackHelper.showSnackInformation(
        'Cep salvo com sucesso!',
        AppColors.greenInformation,
        context,
      );
      cidade = _result;
    } catch (e) {
      isError = true;
      errorMessage = 'Erro ao realizar busca do CEP: $cepController';
    }
    isLoading = false;
  }

  @action
  Future<void> saveCEP(Cidade cep) async {
    try {
      isLoading = true;
      await getCepList();
      if (!cepList.contains(cep)) {
        cepList.add(cep);
      }
      await apiProvider.saveCEPList(cepList);
      isLoading = false;
    } catch (_) {}
    isLoading = false;
  }

  @action
  Future<void> getCepList() async {
    try {
      wipeError();
      isLoading = true;

      final _response = await apiProvider.getCEPList();

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
  List<Cidade> cepsFilter = [];

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
  Future<void> deleteCEPList(BuildContext context) async {
    try {
      wipeError();
      isLoading = true;
      await apiProvider.deleteCEPList();
      wipe();
      SnackHelper.showSnackInformation(
        'Lista de ceps excluída com sucesso!',
        AppColors.greenInformation,
        context,
      );
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
    cidade = null;
  }

  @action
  void wipeError() {
    isError = false;
    errorMessage = '';
  }
}
