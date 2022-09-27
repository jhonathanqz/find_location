import 'package:flutter/material.dart';

import 'package:find_location/app/navigation_service.dart';
import 'package:find_location/presentation/shared/global/textfield/simple_textfield.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';
import 'package:find_location/presentation/shared/style/app_size.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';

class SimpleFormAlert extends StatelessWidget {
  final String title;
  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final Function() next;
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType textInputType;
  final String image;

  const SimpleFormAlert({
    Key? key,
    required this.title,
    required this.labelText,
    required this.hintText,
    required this.image,
    required this.onChanged,
    required this.onSubmitted,
    required this.next,
    required this.textEditingController,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: AppSize.size75,
                width: AppSize.size75,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                padding: AppEdgeInsets.vsdm,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: AppEdgeInsets.tmd,
              child: SimpleTextField(
                labelText: labelText,
                hintText: hintText,
                onChanged: onChanged,
                textEditingController: textEditingController,
                obscureText: obscureText,
                textInputType: textInputType,
                onSubmitted: onSubmitted,
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
            child: const Padding(
              padding: AppEdgeInsets.hmd,
              child: Text(
                'Voltar',
                style: AppTextStyles.titleButton,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            next();
          },
          child: Container(
            padding: AppEdgeInsets.sdAll,
            decoration: AppInputBorder.borderRadius.copyWith(
              color: AppColors.primaryColor,
            ),
            child: const Padding(
              padding: AppEdgeInsets.hmd,
              child: Text(
                'Continuar',
                style: AppTextStyles.titleButton,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
