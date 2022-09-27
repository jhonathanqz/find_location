import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';
import 'package:find_location/presentation/shared/style/app_size.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';
import 'package:find_location/app/navigation_service.dart';

class SimpleAlertButton extends StatelessWidget {
  const SimpleAlertButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.image,
    this.callBackCustom,
    this.backText = 'Voltar',
    this.nextText = 'Continuar',
    this.backButtonVisible = true,
  }) : super(key: key);
  final String text;
  final String backText;
  final String nextText;
  final String image;
  final Function() onTap;
  final VoidCallback? callBackCustom;
  final bool backButtonVisible;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      backgroundColor: AppColors.white,
      title: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: AppSize.size75,
                    width: AppSize.size75,
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
                Container(
                  padding: AppEdgeInsets.tmd,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Visibility(
          visible: backButtonVisible,
          child: InkWell(
            onTap: () async {
              coolNavigate.goBack();
              onTap();
            },
            child: Container(
              padding: AppEdgeInsets.sdAll,
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  nextText,
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
          visible: backButtonVisible,
          child: InkWell(
            onTap: () {
              if (callBackCustom != null) {
                callBackCustom!();
                return;
              }
              coolNavigate.goBack();
            },
            child: Container(
              padding: AppEdgeInsets.sdAll,
              decoration:
                  AppInputBorder.borderRadius.copyWith(color: Colors.grey[400]),
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
          visible: !backButtonVisible,
          child: InkWell(
            onTap: () async {
              coolNavigate.goBack();
              onTap();
            },
            child: Container(
              padding: AppEdgeInsets.sdAll,
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  nextText,
                  style: AppTextStyles.titleButton.copyWith(
                    fontWeight: FontWeight.w800,
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
