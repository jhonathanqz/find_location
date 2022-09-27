import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/global/alert/simple_form_alert.dart';

class DailyPasswordDialog extends SimpleFormAlert {
  const DailyPasswordDialog({
    Key? key,
    required String label,
    required String hint,
    required Function(String) onChanged,
    required Function(String) onSubmitted,
    required Function() next,
    required TextEditingController textEditingController,
    required String image,
  }) : super(
          key: key,
          title: 'Digite a senha diária\npara continuar.',
          labelText: label,
          hintText: hint,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          next: next,
          textEditingController: textEditingController,
          obscureText: true,
          textInputType: TextInputType.number,
          image: image,
        );
}
