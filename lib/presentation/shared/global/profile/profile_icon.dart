import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/style/app_colors.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
