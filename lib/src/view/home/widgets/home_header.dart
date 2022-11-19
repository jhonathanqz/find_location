import 'package:flutter/material.dart';

import 'package:find_location/src/shared/global/header/base_header.dart';
import 'package:find_location/src/shared/style/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseHeader(
      children: [
        TextSpan(
          text: 'Selecione o ',
        ),
        TextSpan(
          text: 'menu',
          style: AppTextStyles.headingBold,
        ),
        TextSpan(
          text: '\ndesejado.',
        ),
      ],
    );
  }
}
