import 'package:flutter/material.dart';

import 'package:find_location/src/model/cidade.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    Key? key,
    required this.cidade,
  }) : super(key: key);
  final Cidade cidade;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _tile(cidade.zipcode, 'CEP'),
          _tile(cidade.city, 'Cidade'),
          _tile(cidade.district, 'Bairro'),
          _tile(cidade.uf, 'Estado'),
          _tile(cidade.publicPlace, 'Endereço'),
        ],
      ),
    );
  }

  _tile(String title, String description) => ListTile(
        title: Text(title),
        subtitle: Text(description),
      );
}
