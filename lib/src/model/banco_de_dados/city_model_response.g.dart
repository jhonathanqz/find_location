// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModelResponse _$CityModelResponseFromJson(Map<String, dynamic> json) =>
    CityModelResponse(
      cep: json['cep'] as String?,
      logradouro: json['logradouro'] as String?,
      complemento: json['complemento'] as String?,
      bairro: json['bairro'] as String?,
      localidade: json['localidade'] as String?,
      uf: json['uf'] as String?,
      ibge: json['ibge'] as String?,
      ddd: json['ddd'] as String?,
    );

Map<String, dynamic> _$CityModelResponseToJson(CityModelResponse instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'localidade': instance.localidade,
      'uf': instance.uf,
      'ibge': instance.ibge,
      'ddd': instance.ddd,
    };
