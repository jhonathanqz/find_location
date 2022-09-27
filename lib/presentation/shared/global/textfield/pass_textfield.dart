import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';

class PassTextField extends StatelessWidget {
  const PassTextField({
    Key? key,
    required this.textEditingController,
    required this.onChanged,
    required this.labelText,
    required this.hintText,
    required this.textInputType,
    this.focusNode,
    required this.onSubmitted,
    this.errorText,
    this.autofocus = false,
    this.obscureText = false,
    required this.onTapSufix,
    required this.widgetIcon,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onSubmitted;
  final FocusNode? focusNode;
  final bool? autofocus;
  final String? errorText;
  final Function() onTapSufix;
  final Widget widgetIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.text,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorText,
        labelText: labelText,
        labelStyle: AppTextStyles.labelStyle,
        hintText: hintText,
        border: AppInputBorder.inputBorder,
        focusedBorder: AppInputBorder.focusedInputBorder,
        suffixIcon: GestureDetector(
          onTap: onTapSufix,
          child: widgetIcon,
        ),
      ),
    );
  }
}
