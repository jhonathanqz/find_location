import 'package:flutter/material.dart';

import 'package:find_location/src/shared/global/appbar/app_bar_widget.dart';
import 'package:find_location/src/shared/global/loading/loading.dart';
import 'package:find_location/src/shared/style/app_colors.dart';

class ScaffoldPrimary extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? leading;
  final bool isLoading;
  final Widget? widgetAction;
  final bool isAction;
  final Widget? header;
  final Widget? footer;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;

  const ScaffoldPrimary({
    Key? key,
    required this.title,
    required this.child,
    this.isLoading = false,
    this.leading,
    this.widgetAction,
    this.header,
    this.footer,
    this.floatingActionButton,
    this.isAction = false,
    this.bottom,
    this.floatingActionButtonLocation,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBarWidget(
            title: title,
            context: context,
            leading: leading,
            widget: isAction ? widgetAction! : Container(),
            bottom: bottom,
          ),
      floatingActionButton: floatingActionButton ?? Container(),
      floatingActionButtonLocation:
          floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
      backgroundColor: AppColors.background,
      body: Loading(
        isLoading: isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header ?? Container(),
            Expanded(child: child),
            footer ?? Container(),
          ],
        ),
      ),
    );
  }
}
