import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class City extends Equatable {
  final String zipcode;
  final String publicPlace;
  final String complement;
  final String district;
  final String city;
  final String uf;
  final String ibge;
  final String ddd;

  const City({
    this.zipcode = '',
    this.publicPlace = '',
    this.complement = '',
    this.district = '',
    this.city = '',
    this.uf = '',
    this.ibge = '',
    this.ddd = '',
  });

  String get fullName => '$zipcode $publicPlace';

  City copyWith({
    String? zipcode,
    String? publicPlace,
    String? complement,
    String? district,
    String? city,
    String? uf,
    String? ibge,
    String? ddd,
  }) =>
      City(
        zipcode: zipcode ?? this.zipcode,
        publicPlace: publicPlace ?? this.publicPlace,
        complement: complement ?? this.complement,
        district: district ?? this.district,
        city: city ?? this.city,
        uf: uf ?? this.uf,
        ibge: ibge ?? this.ibge,
        ddd: ddd ?? this.ddd,
      );

  @override
  List<Object?> get props => [
        zipcode,
        publicPlace,
        complement,
        district,
        city,
        uf,
        ibge,
        ddd,
      ];
}
