import 'package:flutter/material.dart';

import 'package:find_location/domain/entities/city.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    Key? key,
    required this.city,
  }) : super(key: key);
  final City city;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _tile(city.zipcode, 'CEP'),
          _tile(city.city, 'Cidade'),
          _tile(city.district, 'Bairro'),
          _tile(city.uf, 'Estado'),
          _tile(city.publicPlace, 'Endereço'),
        ],
      ),
    );
  }

  _tile(String title, String description) => ListTile(
        title: Text(title),
        subtitle: Text(description),
      );
}
