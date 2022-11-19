import 'package:flutter/material.dart';

import 'package:find_location/src/shared/global/loading/color_loader.dart';
import 'package:find_location/src/shared/style/app_colors.dart';
import 'package:find_location/src/shared/style/app_text_styles.dart';

@immutable
class ButtonPrimary extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool loading;
  final Color colorButton;
  final Color colorText;
  final bool elevation;

  const ButtonPrimary({
    Key? key,
    required this.onTap,
    required this.title,
    this.loading = false,
    this.colorButton = AppColors.primaryColor,
    this.colorText = AppColors.white,
    this.elevation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onTap,
      child: SizedBox(
        height: 50.0,
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: colorButton,
          elevation: elevation ? 5.0 : 0.0,
          child: Center(
            child: loading
                ? _loading
                : Text(
                    title,
                    style: AppTextStyles.titleButton.copyWith(
                      color: colorText,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }

  Widget get _loading => const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ColorLoader(
          duration: Duration(seconds: 2),
        ),
      );
}
