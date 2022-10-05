import 'package:flutter/material.dart';

import 'package:find_location/app/navigation_service.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';
import 'package:find_location/presentation/shared/style/app_size.dart';
import 'package:find_location/presentation/shared/style/app_spacing.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';
import 'package:find_location/utils/layout.dart';

@immutable
class AlertInfo extends StatelessWidget {
  final String message;
  final Function() function;
  final VoidCallback? onReturn;
  final String? textButton;
  final String backText;
  final String title;
  final bool isDualButton;
  const AlertInfo({
    Key? key,
    required this.title,
    required this.message,
    required this.function,
    this.textButton = 'Finalizar',
    this.backText = 'Voltar',
    this.isDualButton = false,
    this.onReturn,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppInputBorder.borderRadiusAll,
      ),
      elevation: 2,
      backgroundColor: AppColors.white,
      title: SizedBox(
        width: Layout.getSize(context).width / 2,
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.info,
                size: 40,
              ),
            ),
            AppSpacing.sm,
            Center(
              child: Text(
                title,
                style: AppTextStyles.titleBold.copyWith(
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: AppEdgeInsets.tmd,
              child: Text(
                message,
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Visibility(
          visible: isDualButton,
          child: InkWell(
            onTap: () {
              if (onReturn != null) {
                onReturn!();
                return;
              }
              coolNavigate.goBack();
            },
            child: Container(
              padding: AppEdgeInsets.sdAll,
              decoration: AppInputBorder.borderRadius.copyWith(
                color: AppColors.grey3,
              ),
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  backText,
                  style: AppTextStyles.titleButton,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isDualButton,
          child: InkWell(
            onTap: function,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  textButton!,
                  style: AppTextStyles.titleButton.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isDualButton,
          child: InkWell(
            onTap: function,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  textButton!,
                  style: AppTextStyles.titleButton.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
