import 'package:flutter/material.dart';

import 'package:find_location/app/routes.dart';
import 'package:find_location/presentation/features/about/pages/about_page.dart';
import 'package:find_location/presentation/features/city/pages/history_page.dart';
import 'package:find_location/presentation/features/city/pages/search_page.dart';
import 'package:find_location/presentation/features/home/pages/home_page.dart';
import 'package:find_location/presentation/features/splash/pages/splash_page.dart';

class AppModule {
  static String get initialRoute => Routes.splash;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.splash: (_) => const SplashPage(),
    Routes.home: (_) => const HomePage(),
    Routes.search: (_) => SearchPage(
        isReset: ModalRoute.of(_)?.settings.arguments.toString() ?? ''),
    Routes.history: (_) => const HistoryPage(),
    Routes.about: (_) => const AboutPage(),
  };

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
