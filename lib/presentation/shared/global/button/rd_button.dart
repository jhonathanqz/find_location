import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/utils/layout.dart';

class RDButton extends StatelessWidget {
  final String buttonName;
  final Color color;
  final bool loading;
  final Function() onPressed;
  const RDButton({
    required this.buttonName,
    required this.color,
    required this.onPressed,
    this.loading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: color,
      child: MaterialButton(
        minWidth: Layout.getSize(context).width,
        height: Layout.getSize(context).height * 0.06,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: onPressed,
        child: loading
            ? _loading
            : Text(
                buttonName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
      ),
    );
  }

  Widget get _loading => const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            AppColors.white,
          ),
        ),
      );
}
