import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';

@immutable
class AppBarSearch extends PreferredSize {
  AppBarSearch({
    Key? key,
    required Widget widgetSearch,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: AppColors.appBarColor,
            toolbarHeight: 100.0,
            title: Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              decoration: AppInputBorder.borderRadius,
              child: widgetSearch,
            ),
          ),
        );
}
