import 'package:flutter/material.dart';

import 'package:easy_mask/easy_mask.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:find_location/app/injection_container.dart';
import 'package:find_location/app/navigation_service.dart';
import 'package:find_location/app/routes.dart';
import 'package:find_location/presentation/features/city/mobx/city.controller.dart';
import 'package:find_location/presentation/shared/global/scaffold/scaffold_primary.dart';
import 'package:find_location/presentation/shared/global/textfield/simple_textfield.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_spacing.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late CityController _controller;
  final _searchController = TextEditingController();
  late ReactionDisposer _reactionGetCeps;

  @override
  void initState() {
    _controller = sl<CityController>();
    _reset();
    _reactionGetCeps = autorun(
      (_) async {
        await _controller.getCepList();
      },
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller = sl<CityController>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _reactionGetCeps.call();
    _searchController.dispose();
    super.dispose();
  }

  void _reset() {
    _searchController.text = '';
    _controller.wipe();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ScaffoldPrimary(
          title: 'Histórico',
          child: Padding(
            padding: AppEdgeInsets.sdAll,
            child: Column(
              children: [
                SimpleTextField(
                  textEditingController: _searchController,
                  onChanged: _controller.setFilter,
                  labelText: 'CEP',
                  hintText: 'Pesquisar CEP',
                  textInputType: TextInputType.number,
                  onSubmitted: (e) {
                    if (e == '') return;
                    _controller.setFilter(e);
                  },
                  inputFormatters: [
                    TextInputMask(
                      mask: [
                        '99999-999',
                      ],
                    ),
                  ],
                ),
                AppSpacing.xl,
                _controller.cepsFilter.isNotEmpty && _controller.filter != ''
                    ? _buildCepsFilter()
                    : _buildCepList(),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildCepList() => Expanded(
        child: ListView.builder(
          itemCount: _controller.cepList.length,
          itemBuilder: (context, index) {
            final _cep = _controller.cepList[index];
            return InkWell(
              onTap: () {
                _controller.setCep(_cep);
                coolNavigate.pushReplacementNamed(Routes.search);
              },
              child: ListTile(
                title: Text(_cep),
                subtitle: const Text('CEP'),
              ),
            );
          },
        ),
      );

  _buildCepsFilter() => Expanded(
        child: ListView.builder(
          itemCount: _controller.cepsFilter.length,
          itemBuilder: (context, index) {
            final _cep = _controller.cepsFilter[index];
            return InkWell(
              onTap: () {
                _controller.setCep(_cep);
                coolNavigate.pushReplacementNamed(Routes.search);
              },
              child: ListTile(
                title: Text(_cep),
                subtitle: const Text('CEP'),
              ),
            );
          },
        ),
      );
}
