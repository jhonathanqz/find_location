import 'package:flutter/material.dart';

import 'package:easy_mask/easy_mask.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:find_location/app/injection_container.dart';
import 'package:find_location/app/navigation_service.dart';
import 'package:find_location/app/routes.dart';
import 'package:find_location/src/controller/cidade.controller.dart';
import 'package:find_location/src/shared/global/alert/alert_info.dart';
import 'package:find_location/src/shared/global/scaffold/scaffold_primary.dart';
import 'package:find_location/src/shared/global/textfield/simple_textfield.dart';
import 'package:find_location/src/shared/helpers/dialog_helper.dart';
import 'package:find_location/src/shared/style/app_colors.dart';
import 'package:find_location/src/shared/style/app_edge_insets.dart';
import 'package:find_location/src/shared/style/app_spacing.dart';
import 'package:find_location/src/shared/style/app_text_styles.dart';
import 'package:find_location/utils/info_exception.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late CidadeController _controller;
  late ReactionDisposer _reactionErrorHistory;
  final _searchController = TextEditingController();
  late ReactionDisposer _reactionGetCeps;

  @override
  void initState() {
    _controller = sl<CidadeController>();
    _reset();
    _reactionGetCeps = autorun(
      (_) async {
        await _controller.getCepList();
        setState(() {});
      },
    );

    _reactionErrorHistory = reaction(
      (_) => _controller.isError,
      (_) {
        if (_controller.isError) {
          _controller.isError = false;
          InfoException.showInfoException(
              context: context, message: _controller.errorMessage);
        }
      },
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller = sl<CidadeController>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _reactionGetCeps.call();
    _searchController.dispose();
    _reactionErrorHistory.call();
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
          isAction: true,
          widgetAction: IconButton(
            onPressed: () => _delete(),
            icon: const Icon(
              Icons.delete,
              color: AppColors.white,
            ),
          ),
          child: Padding(
            padding: AppEdgeInsets.sdAll,
            child: Column(
              children: [
                _controller.isFilterName
                    ? SimpleTextField(
                        textEditingController: _searchController,
                        onChanged: _controller.setFilter,
                        labelText: 'Endereço',
                        hintText: 'Pesquisar Endereço',
                        textInputType: TextInputType.text,
                        onSubmitted: (e) {
                          if (e == '') return;
                          _controller.setFilter(e);
                          setState(() {});
                        },
                      )
                    : SimpleTextField(
                        textEditingController: _searchController,
                        onChanged: _controller.setFilter,
                        labelText: 'CEP',
                        hintText: 'Pesquisar CEP',
                        textInputType: TextInputType.number,
                        onSubmitted: (e) {
                          if (e == '') return;
                          _controller.setFilter(e);
                          setState(() {});
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
                ListTile(
                  title: const Text('Filtrar por endereço?'),
                  trailing: Switch(
                    value: _controller.isFilterName,
                    onChanged: (e) {
                      _controller.isFilterName = e;
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
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
        child: _controller.cepList.isNotEmpty
            ? ListView.builder(
                itemCount: _controller.cepList.length,
                itemBuilder: (context, index) {
                  final _cep = _controller.cepList[index];
                  final isName = _controller.isFilterName;
                  final _place =
                      _cep.publicPlace != '' ? _cep.publicPlace : 'Sem dados';
                  final _zipCode = _cep.zipcode;
                  return InkWell(
                    onTap: () {
                      _controller.setCep(_cep.zipcode);
                      coolNavigate.pushReplacementNamed(Routes.search);
                    },
                    child: ListTile(
                      title: Text(isName ? _place : _zipCode),
                      subtitle:
                          Text(isName ? 'Endereço / CEP: $_zipCode' : 'CEP'),
                    ),
                  );
                },
              )
            : const SizedBox(
                child: Center(
                  child: Text(
                    'Nenhum histórico encontrado',
                    style: AppTextStyles.title,
                  ),
                ),
              ),
      );

  _buildCepsFilter() => Expanded(
        child: ListView.builder(
          itemCount: _controller.cepsFilter.length,
          itemBuilder: (context, index) {
            final _cep = _controller.cepsFilter[index];
            final isName = _controller.isFilterName;
            final _place =
                _cep.publicPlace != '' ? _cep.publicPlace : 'Sem dados';
            final _zipCode = _cep.zipcode;
            return InkWell(
              onTap: () {
                _controller.setCep(_cep.zipcode);
                coolNavigate.pushReplacementNamed(Routes.search);
              },
              child: ListTile(
                title: Text(isName ? _place : _zipCode),
                subtitle: Text(isName ? 'Endereço / CEP: $_zipCode' : 'CEP'),
              ),
            );
          },
        ),
      );

  void _delete() {
    DialogHelper.open(
      context: context,
      content: AlertInfo(
        title: 'Atenção!',
        message: 'Confirma exclusão de todo seu histórico de consultas?',
        textButton: 'Sim',
        backText: 'Não',
        isDualButton: true,
        function: () async {
          coolNavigate.goBack();
          await _controller.deleteCEPList(context);
        },
      ),
    );
  }
}
