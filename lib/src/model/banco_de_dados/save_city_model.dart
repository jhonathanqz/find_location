import 'package:json_annotation/json_annotation.dart';

import 'package:find_location/src/model/banco_de_dados/city_model_response.dart';

part 'save_city_model.g.dart';

@JsonSerializable()
class SaveCityModel {
  @JsonKey(name: 'cities')
  final List<CityModelResponse> citiesList;

  SaveCityModel({
    required this.citiesList,
  });

  factory SaveCityModel.fromJson(Map<String, dynamic> json) =>
      _$SaveCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCityModelToJson(this);
}
