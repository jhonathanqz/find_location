import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:easy_mask/easy_mask.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:find_location/app/injection_container.dart';
import 'package:find_location/presentation/features/city/mobx/city.controller.dart';
import 'package:find_location/presentation/features/city/widgets/city_card.dart';
import 'package:find_location/presentation/shared/global/button/button_primary.dart';
import 'package:find_location/presentation/shared/global/header/base_header.dart';
import 'package:find_location/presentation/shared/global/scaffold/scaffold_primary.dart';
import 'package:find_location/presentation/shared/global/textfield/simple_textfield.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_spacing.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';
import 'package:find_location/utils/info_exception.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    this.isReset = '',
  }) : super(key: key);

  final String isReset;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late CityController _controller;
  late ReactionDisposer _reactionError;
  final _cepController = TextEditingController();

  @override
  void initState() {
    _controller = sl<CityController>();
    _cepController.text = _controller.cepController;
    _reset();

    _reactionError = reaction(
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
    _controller = sl<CityController>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _cepController.dispose();
    _reactionError.call();
    super.dispose();
  }

  void _reset() {
    if (widget.isReset != '' && widget.isReset.contains('reset')) {
      _cepController.text = '';
      _controller.wipe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ScaffoldPrimary(
          isLoading: _controller.isLoading,
          title: 'Pesquisar CEP',
          child: Padding(
            padding: AppEdgeInsets.sdAll,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  AppSpacing.md,
                  SimpleTextField(
                    textEditingController: _cepController,
                    onChanged: _controller.setCep,
                    labelText: 'CEP',
                    hintText: 'Digite o CEP',
                    textInputType: TextInputType.number,
                    onSubmitted: (_) {},
                    inputFormatters: [
                      TextInputMask(
                        mask: [
                          '99999-999',
                        ],
                      ),
                    ],
                  ),
                  AppSpacing.xl,
                  ButtonPrimary(
                    onTap: () async {
                      if (_controller.cepController.trim() == '') return;
                      await _controller.searchCEP();
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    title: 'Buscar',
                    colorButton: _controller.cepController != ''
                        ? AppColors.primaryColor
                        : AppColors.grey,
                  ),
                  _controller.city != null
                      ? CityCard(city: _controller.city!)
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _header() => const BaseHeader(
        children: [
          TextSpan(
            text: 'Digite abaixo o',
          ),
          TextSpan(
            text: '\nCEP',
            style: AppTextStyles.headingBold,
          ),
          TextSpan(
            text: ' desejado.',
          ),
        ],
      );
}
