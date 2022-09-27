import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/app/navigation_service.dart';

class Alert extends StatelessWidget {
  const Alert({
    Key? key,
    required this.title,
    required this.message,
    required this.onTap,
    this.textBack = 'Voltar',
    this.textNext = 'Continuar',
  }) : super(key: key);
  final String title;
  final String message;
  final Function() onTap;
  final String? textBack;
  final String? textNext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.black,
        ),
      ),
      content: Text(
        message,
      ),
      actions: <Widget>[
        InkWell(
          onTap: () => coolNavigate.goBack(),
          child: Container(
            color: AppColors.primaryColor,
            child: Text(
              textBack!,
              style: const TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: SizedBox(
            //color: Layout.danger(),
            child: Text(
              textNext!,
              style: const TextStyle(
                color: AppColors.appBarColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
