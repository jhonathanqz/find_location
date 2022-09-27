import 'package:flutter/material.dart';

import 'package:find_location/app/navigation_service.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_images.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';
import 'package:find_location/presentation/shared/style/app_size.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';

class AlertStock extends StatelessWidget {
  final String message;
  final Function() function;
  final String? textButton;
  final String title;
  const AlertStock({
    Key? key,
    required this.message,
    required this.function,
    this.textButton,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      backgroundColor: AppColors.white,
      title: SizedBox(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: AppSize.size80,
                width: AppSize.size80,
                child: Image.asset(AppImages.alert),
              ),
            ),
            Center(
              child: Text(
                title,
                style: AppTextStyles.titleBold.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            Container(
              padding: AppEdgeInsets.tmd,
              child: Text(
                message,
                style: AppTextStyles.title.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            coolNavigate.goBack();
          },
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
          onTap: () {
            function();
            coolNavigate.goBack();
          },
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
    );
  }
}
