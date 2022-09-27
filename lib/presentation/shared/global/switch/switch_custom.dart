import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/style/app_colors.dart';

class SwitchCustom extends StatelessWidget {
  const SwitchCustom({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  final Function(bool) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _buildIOSSwitch() : _buildAndroidSwitch();
  }

  Widget _buildIOSSwitch() => CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryColor,
      );

  Widget _buildAndroidSwitch() => Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryColor,
      );
}
