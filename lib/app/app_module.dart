import 'package:flutter/material.dart';

import 'package:find_location/app/routes.dart';
import 'package:find_location/src/view/cidade/pages/history_page.dart';
import 'package:find_location/src/view/cidade/pages/search_page.dart';
import 'package:find_location/src/view/home/pages/home_page.dart';
import 'package:find_location/src/view/splash/pages/splash_page.dart';

class AppModule {
  static String get initialRoute => Routes.splash;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.splash: (_) => const SplashPage(),
    Routes.home: (_) => const HomePage(),
    Routes.search: (_) => SearchPage(
        isReset: ModalRoute.of(_)?.settings.arguments.toString() ?? ''),
    Routes.history: (_) => const HistoryPage(),
  };

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
