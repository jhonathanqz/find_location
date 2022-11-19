// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cidade.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CidadeController on CidadeBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'CidadeBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom = Atom(name: 'CidadeBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'CidadeBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$cidadeAtom = Atom(name: 'CidadeBase.cidade', context: context);

  @override
  Cidade? get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(Cidade? value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  late final _$cepControllerAtom =
      Atom(name: 'CidadeBase.cepController', context: context);

  @override
  String get cepController {
    _$cepControllerAtom.reportRead();
    return super.cepController;
  }

  @override
  set cepController(String value) {
    _$cepControllerAtom.reportWrite(value, super.cepController, () {
      super.cepController = value;
    });
  }

  late final _$cepListAtom = Atom(name: 'CidadeBase.cepList', context: context);

  @override
  List<Cidade> get cepList {
    _$cepListAtom.reportRead();
    return super.cepList;
  }

  @override
  set cepList(List<Cidade> value) {
    _$cepListAtom.reportWrite(value, super.cepList, () {
      super.cepList = value;
    });
  }

  late final _$cepsFilterAtom =
      Atom(name: 'CidadeBase.cepsFilter', context: context);

  @override
  List<Cidade> get cepsFilter {
    _$cepsFilterAtom.reportRead();
    return super.cepsFilter;
  }

  @override
  set cepsFilter(List<Cidade> value) {
    _$cepsFilterAtom.reportWrite(value, super.cepsFilter, () {
      super.cepsFilter = value;
    });
  }

  late final _$filterAtom = Atom(name: 'CidadeBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$isFilterNameAtom =
      Atom(name: 'CidadeBase.isFilterName', context: context);

  @override
  bool get isFilterName {
    _$isFilterNameAtom.reportRead();
    return super.isFilterName;
  }

  @override
  set isFilterName(bool value) {
    _$isFilterNameAtom.reportWrite(value, super.isFilterName, () {
      super.isFilterName = value;
    });
  }

  late final _$searchCEPAsyncAction =
      AsyncAction('CidadeBase.searchCEP', context: context);

  @override
  Future<void> searchCEP(BuildContext context) {
    return _$searchCEPAsyncAction.run(() => super.searchCEP(context));
  }

  late final _$saveCEPAsyncAction =
      AsyncAction('CidadeBase.saveCEP', context: context);

  @override
  Future<void> saveCEP(Cidade cep) {
    return _$saveCEPAsyncAction.run(() => super.saveCEP(cep));
  }

  late final _$getCepListAsyncAction =
      AsyncAction('CidadeBase.getCepList', context: context);

  @override
  Future<void> getCepList() {
    return _$getCepListAsyncAction.run(() => super.getCepList());
  }

  late final _$deleteCEPListAsyncAction =
      AsyncAction('CidadeBase.deleteCEPList', context: context);

  @override
  Future<void> deleteCEPList(BuildContext context) {
    return _$deleteCEPListAsyncAction.run(() => super.deleteCEPList(context));
  }

  late final _$CidadeBaseActionController =
      ActionController(name: 'CidadeBase', context: context);

  @override
  void setCep(String value) {
    final _$actionInfo =
        _$CidadeBaseActionController.startAction(name: 'CidadeBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$CidadeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(String value) {
    final _$actionInfo =
        _$CidadeBaseActionController.startAction(name: 'CidadeBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$CidadeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wipe() {
    final _$actionInfo =
        _$CidadeBaseActionController.startAction(name: 'CidadeBase.wipe');
    try {
      return super.wipe();
    } finally {
      _$CidadeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wipeError() {
    final _$actionInfo =
        _$CidadeBaseActionController.startAction(name: 'CidadeBase.wipeError');
    try {
      return super.wipeError();
    } finally {
      _$CidadeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
errorMessage: ${errorMessage},
cidade: ${cidade},
cepController: ${cepController},
cepList: ${cepList},
cepsFilter: ${cepsFilter},
filter: ${filter},
isFilterName: ${isFilterName}
    ''';
  }
}
