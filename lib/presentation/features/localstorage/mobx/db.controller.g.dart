// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DbController on DBBase, Store {
  late final _$isLoadingAtom = Atom(name: 'DBBase.isLoading', context: context);

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

  late final _$insertAsyncAction =
      AsyncAction('DBBase.insert', context: context);

  @override
  Future<void> insert(String key, List<String> value) {
    return _$insertAsyncAction.run(() => super.insert(key, value));
  }

  late final _$deleteAsyncAction =
      AsyncAction('DBBase.delete', context: context);

  @override
  Future<void> delete(String key) {
    return _$deleteAsyncAction.run(() => super.delete(key));
  }

  late final _$putAsyncAction = AsyncAction('DBBase.put', context: context);

  @override
  Future<void> put(String key, List<String> value) {
    return _$putAsyncAction.run(() => super.put(key, value));
  }

  late final _$getAsyncAction = AsyncAction('DBBase.get', context: context);

  @override
  Future<List<String>> get(String key) {
    return _$getAsyncAction.run(() => super.get(key));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
