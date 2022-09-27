import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.callbackFn,
    required this.icon,
    this.colorButton = AppColors.grey,
  }) : super(key: key);

  final Function() callbackFn;
  final Widget icon;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callbackFn,
      child: Container(
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          color: colorButton,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
