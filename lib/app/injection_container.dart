import 'package:get_it/get_it.dart';

import 'package:find_location/app/client_factory.dart';
import 'package:find_location/src/controller/cidade.controller.dart';
import 'package:find_location/src/controller/db.controller.dart';
import 'package:find_location/src/controller/splash.store.dart';
import 'package:find_location/src/provider/api_provider.dart';
import 'package:find_location/src/provider/localstorage_provider.dart';

final sl = GetIt.I;

void setupDependencies() {
  setupClient();
  setupProvider();

  setupMobx();
}

void setupClient() {
  final client = ClientFactory.baseClient!;

  client.options.followRedirects = false;
  client.options.connectTimeout = 10 * 1000;
  client.options.receiveTimeout = 10 * 2000;
}

void setupProvider() {
  sl.registerLazySingleton<LocalStorageProvider>(
    () => LocalStorageProvider(),
    dispose: (_) => sl.resetLazySingleton<LocalStorageProvider>(),
  );

  sl.registerLazySingleton<ApiProvider>(
    () => ApiProvider(
      http: ClientFactory.baseClient!,
      dbController: sl<DbController>(),
    ),
    dispose: (_) => sl.resetLazySingleton<ApiProvider>(),
  );
}

setupMobx() {
  sl.registerLazySingleton<DbController>(
    () => DbController(
      localStorageProvider: sl<LocalStorageProvider>(),
    ),
    dispose: (_) => sl.resetLazySingleton<DbController>(),
  );

  sl.registerLazySingleton<SplashStore>(
    () => SplashStore(),
    dispose: (_) => sl.resetLazySingleton<SplashStore>(),
  );

  sl.registerLazySingleton<CidadeController>(
    () => CidadeController(
      apiProvider: sl<ApiProvider>(),
    ),
    dispose: (_) => sl.resetLazySingleton<CidadeController>(),
  );
}
