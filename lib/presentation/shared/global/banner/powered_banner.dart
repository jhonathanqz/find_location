import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';

class PoweredBanner extends StatelessWidget {
  const PoweredBanner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppEdgeInsets.vsd,
      child: Center(
        child: SizedBox(
          child: RichText(
            text: const TextSpan(
              text: 'PDV Mobile ',
              style: TextStyle(
                  fontSize: 13,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                  text: 'powered by Accesys Solutions.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
