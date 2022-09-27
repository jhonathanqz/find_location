import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';
import 'package:find_location/presentation/shared/style/app_size.dart';
import 'package:find_location/presentation/shared/style/app_spacing.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';
import 'package:find_location/utils/layout.dart';

@immutable
class AlertReprinter extends StatelessWidget {
  final String message;
  final Function() nextFunction;
  final Function() backFunction;
  final String? textButton;
  final String title;
  final bool isDualButton;
  final String image;
  const AlertReprinter({
    Key? key,
    required this.title,
    required this.message,
    required this.nextFunction,
    required this.backFunction,
    this.textButton = 'Finalizar',
    this.isDualButton = false,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppInputBorder.borderRadiusAll,
        ),
        elevation: 2,
        backgroundColor: AppColors.white,
        title: SizedBox(
          width: Layout.getSize(context).width / 2,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: AppSize.size56,
                  width: AppSize.size56,
                  child: Image.asset(image),
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
          InkWell(
            onTap: backFunction,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              decoration: AppInputBorder.borderRadius.copyWith(
                color: AppColors.grey3,
              ),
              child: const Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  'Não',
                  style: AppTextStyles.titleButton,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: nextFunction,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  'Sim',
                  style: AppTextStyles.titleButton.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
