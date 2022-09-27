import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/global/appbar/app_bar_search.dart';
import 'package:find_location/presentation/shared/global/loading/loading.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';

class ScaffoldSearch extends StatelessWidget {
  final Widget child;
  final Widget? leading;
  final bool isLoading;
  final Widget? widgetAction;
  final bool isAction;
  final Widget? header;
  final Widget? footer;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;

  final Function() onTapCart;
  final Function() onTapBarcode;
  final Widget widgetSearch;

  const ScaffoldSearch({
    Key? key,
    required this.child,
    this.isLoading = false,
    this.leading,
    this.widgetAction,
    this.header,
    this.footer,
    this.floatingActionButton,
    this.isAction = false,
    this.bottom,
    required this.onTapCart,
    required this.onTapBarcode,
    required this.widgetSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearch(
        widgetSearch: widgetSearch,
      ),
      floatingActionButton: floatingActionButton ?? Container(),
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
