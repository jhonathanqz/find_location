import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:find_location/app/navigation_service.dart';
import 'package:find_location/app/routes.dart';

part 'splash.store.g.dart';

class SplashStore = SplashBase with _$SplashStore;

abstract class SplashBase with Store {
  @action
  Future<void> dismissSplashScreen(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    coolNavigate.pushReplacementNamed(Routes.home);
  }
}
