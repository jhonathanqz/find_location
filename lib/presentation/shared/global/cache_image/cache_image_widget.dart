import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';

class CacheImageWidget extends StatelessWidget {
  const CacheImageWidget({
    Key? key,
    required this.imageUrl,
    this.iconColor = Colors.black,
    this.isVisibilityError = true,
  }) : super(key: key);
  final String imageUrl;
  final Color iconColor;
  final bool isVisibilityError;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            AppColors.white,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Visibility(
        visible: isVisibilityError,
        child: Icon(
          Icons.error,
          color: iconColor,
        ),
      ),
    );
  }
}
