import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';
import 'package:find_location/presentation/shared/style/app_size.dart';
import 'package:find_location/presentation/shared/style/app_spacing.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';
import 'package:find_location/utils/layout.dart';

@immutable
class AlertInfoError extends StatelessWidget {
  final String message;
  final Function() function;
  final String? textButton;
  final String title;
  final bool isBackButton;
  final Color colorButton;
  const AlertInfoError({
    Key? key,
    required this.title,
    required this.message,
    required this.function,
    this.textButton = 'Finalizar',
    this.isBackButton = false,
    required this.colorButton,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppInputBorder.borderRadiusAll,
      ),
      elevation: 2,
      backgroundColor: AppColors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Layout.getSize(context).width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: SizedBox(
                    height: AppSize.size56,
                    width: AppSize.size56,
                    child: Icon(Icons.error),
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
                Center(
                  child: Container(
                    padding: AppEdgeInsets.tmd,
                    child: Text(
                      message,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !isBackButton,
            child: Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                onTap: function,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey7,
                    shape: BoxShape.circle,
                  ),
                  width: 27,
                  height: 27,
                  child: const Icon(
                    Icons.close,
                    size: 12,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //content: Visibility(
      //  visible: isBackButton,
      //  child: ButtonPrimary(
      //    colorButton: colorButton,
      //    onTap: function,
      //    title: textButton!,
      //  ),
      //),
      actions: [
        Visibility(
          visible: isBackButton,
          child: InkWell(
            onTap: function,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              decoration: AppInputBorder.borderRadius.copyWith(
                color: AppColors.grey3,
              ),
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  textButton!,
                  style: AppTextStyles.titleButton,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
