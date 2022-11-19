import 'package:flutter/material.dart';

import 'package:find_location/src/shared/style/app_colors.dart';

Widget dividerWidget() => Container(
      width: double.infinity,
      height: 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.primaryColor,
            Colors.transparent,
          ],
        ),
      ),
    );
