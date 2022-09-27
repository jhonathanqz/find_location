import 'package:find_location/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:find_location/app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  setupDependencies();

  runApp(
    WillPopScope(
      onWillPop: () async => false,
      child: const App(),
    ),
  );
}
