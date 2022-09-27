import 'package:flutter/material.dart';

import 'package:find_location/app/app_module.dart';
import 'package:find_location/app/navigation_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Location',
      theme: AppModule.theme,
      initialRoute: AppModule.initialRoute,
      navigatorKey: NavigationService.navigationKey,
      routes: AppModule.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
