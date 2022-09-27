import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/global/loading/loading.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';

class ScaffoldLight extends StatelessWidget {
  const ScaffoldLight({
    Key? key,
    required this.child,
    this.isLoading = false,
    this.header,
    this.footer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.isErrorCustomer = false,
    this.scaffoldKey,
  }) : super(key: key);

  final Widget child;
  final bool isLoading;
  final Widget? header;
  final Widget? footer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool isErrorCustomer;
  final Key? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
