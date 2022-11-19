// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveCityModel _$SaveCityModelFromJson(Map<String, dynamic> json) =>
    SaveCityModel(
      citiesList: (json['cities'] as List<dynamic>)
          .map((e) => CityModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaveCityModelToJson(SaveCityModel instance) =>
    <String, dynamic>{
      'cities': instance.citiesList,
    };
