import 'package:json_annotation/json_annotation.dart';

part 'city_model_response.g.dart';

@JsonSerializable()
class CityModelResponse {
  @JsonKey(name: 'cep')
  final String? cep;
  @JsonKey(name: 'logradouro')
  final String? logradouro;
  @JsonKey(name: 'complemento')
  final String? complemento;
  @JsonKey(name: 'bairro')
  final String? bairro;
  @JsonKey(name: 'localidade')
  final String? localidade;
  @JsonKey(name: 'uf')
  final String? uf;
  @JsonKey(name: 'ibge')
  final String? ibge;
  @JsonKey(name: 'ddd')
  final String? ddd;

  CityModelResponse({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ibge,
    this.ddd,
  });

  factory CityModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CityModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelResponseToJson(this);
}
