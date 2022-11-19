import 'package:flutter/material.dart';

import 'package:find_location/app/navigation_service.dart';
import 'package:find_location/src/shared/global/alert/alert_info_error.dart';
import 'package:find_location/src/shared/helpers/dialog_helper.dart';
import 'package:find_location/src/shared/style/app_colors.dart';

class InfoException {
  static void showInfoException({
    required BuildContext context,
    required String message,
    String title = 'Atenção!',
    VoidCallback? call,
  }) {
    DialogHelper.open(
      context: context,
      content: AlertInfoError(
        title: title,
        message: message,
        function: () {
          if (call != null) {
            call();
            return;
          }
          coolNavigate.goBack();
        },
        isBackButton: true,
        textButton: 'Ok',
        colorButton: AppColors.primaryColor,
      ),
    );
  }
}
