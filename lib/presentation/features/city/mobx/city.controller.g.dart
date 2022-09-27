// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CityController on CityBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'CityBase.isLoading', context: context);

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

  late final _$isErrorAtom = Atom(name: 'CityBase.isError', context: context);

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
      Atom(name: 'CityBase.errorMessage', context: context);

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

  late final _$cityAtom = Atom(name: 'CityBase.city', context: context);

  @override
  City? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(City? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$cepControllerAtom =
      Atom(name: 'CityBase.cepController', context: context);

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

  late final _$cepListAtom = Atom(name: 'CityBase.cepList', context: context);

  @override
  List<City> get cepList {
    _$cepListAtom.reportRead();
    return super.cepList;
  }

  @override
  set cepList(List<City> value) {
    _$cepListAtom.reportWrite(value, super.cepList, () {
      super.cepList = value;
    });
  }

  late final _$cepsFilterAtom =
      Atom(name: 'CityBase.cepsFilter', context: context);

  @override
  List<City> get cepsFilter {
    _$cepsFilterAtom.reportRead();
    return super.cepsFilter;
  }

  @override
  set cepsFilter(List<City> value) {
    _$cepsFilterAtom.reportWrite(value, super.cepsFilter, () {
      super.cepsFilter = value;
    });
  }

  late final _$filterAtom = Atom(name: 'CityBase.filter', context: context);

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
      Atom(name: 'CityBase.isFilterName', context: context);

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
      AsyncAction('CityBase.searchCEP', context: context);

  @override
  Future<void> searchCEP() {
    return _$searchCEPAsyncAction.run(() => super.searchCEP());
  }

  late final _$saveCEPAsyncAction =
      AsyncAction('CityBase.saveCEP', context: context);

  @override
  Future<void> saveCEP(City cep) {
    return _$saveCEPAsyncAction.run(() => super.saveCEP(cep));
  }

  late final _$getCepListAsyncAction =
      AsyncAction('CityBase.getCepList', context: context);

  @override
  Future<void> getCepList() {
    return _$getCepListAsyncAction.run(() => super.getCepList());
  }

  late final _$CityBaseActionController =
      ActionController(name: 'CityBase', context: context);

  @override
  void setCep(String value) {
    final _$actionInfo =
        _$CityBaseActionController.startAction(name: 'CityBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$CityBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(String value) {
    final _$actionInfo =
        _$CityBaseActionController.startAction(name: 'CityBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$CityBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wipe() {
    final _$actionInfo =
        _$CityBaseActionController.startAction(name: 'CityBase.wipe');
    try {
      return super.wipe();
    } finally {
      _$CityBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
errorMessage: ${errorMessage},
city: ${city},
cepController: ${cepController},
cepList: ${cepList},
cepsFilter: ${cepsFilter},
filter: ${filter},
isFilterName: ${isFilterName}
    ''';
  }
}
