import 'package:mobx/mobx.dart';

part 'navigation.controller.g.dart';

class NavigationController = NavigationBase with _$NavigationController;

abstract class NavigationBase with Store {
  @observable
  bool? isLoading;
}
