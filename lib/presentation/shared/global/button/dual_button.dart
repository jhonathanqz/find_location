import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/global/button/button_primary.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_spacing.dart';

class DualButton extends StatelessWidget {
  const DualButton({
    Key? key,
    required this.backText,
    required this.nextText,
    required this.backTap,
    required this.nextTap,
  }) : super(key: key);
  final String backText;
  final String nextText;
  final Function() backTap;
  final Function() nextTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppEdgeInsets.vsd,
      child: Row(
        children: [
          Expanded(
            child: ButtonPrimary(
              colorButton: AppColors.grey,
              onTap: backTap,
              title: backText,
            ),
          ),
          AppSpacing.smW,
          Expanded(
            child: ButtonPrimary(
              onTap: nextTap,
              title: nextText,
            ),
          ),
        ],
      ),
    );
  }
}
