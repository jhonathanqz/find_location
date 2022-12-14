import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';

class BaseHeader extends StatelessWidget {
  final List<InlineSpan> children;
  final TextAlign textAlign;

  const BaseHeader({
    Key? key,
    required this.children,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.vsd,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          style: AppTextStyles.heading,
          children: children,
        ),
      ),
    );
  }
}
