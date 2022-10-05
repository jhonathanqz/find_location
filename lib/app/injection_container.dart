import 'package:get_it/get_it.dart';

import 'package:find_location/app/client_factory.dart';
import 'package:find_location/data/features/localstorage/provider/database_provider_impl.dart';
import 'package:find_location/data/features/service/provider/service_provider_impl.dart';
import 'package:find_location/domain/repositories/features/localstorage/database_repository.dart';
import 'package:find_location/domain/repositories/features/service/service_repository.dart';
import 'package:find_location/domain/use_cases/features/localstorage/add_storage_use_case.dart';
import 'package:find_location/domain/use_cases/features/localstorage/delete_storage_use_case.dart';
import 'package:find_location/domain/use_cases/features/localstorage/get_storage_use_case.dart';
import 'package:find_location/domain/use_cases/features/localstorage/put_storage_use_case.dart';
import 'package:find_location/domain/use_cases/features/service/delete_cep_list_use_case.dart';
import 'package:find_location/domain/use_cases/features/service/get_cep_list_use_case.dart';
import 'package:find_location/domain/use_cases/features/service/save_cep_list_use_case.dart';
import 'package:find_location/domain/use_cases/features/service/search_cep_use_case.dart';
import 'package:find_location/infrastructure/features/localstorage/repositories/contracts/database_provider.dart';
import 'package:find_location/infrastructure/features/localstorage/repositories/database_repository_impl.dart';
import 'package:find_location/infrastructure/features/service/repositories/contracts/service_provider.dart';
import 'package:find_location/infrastructure/features/service/repositories/service_repository_impl.dart';
import 'package:find_location/presentation/features/city/mobx/city.controller.dart';
import 'package:find_location/presentation/features/localstorage/mobx/db.controller.dart';
import 'package:find_location/presentation/features/navigation/mobx/navigation.controller.dart';
import 'package:find_location/presentation/features/splash/mobx/splash.store.dart';

final sl = GetIt.I;

void setupDependencies() {
  setupClient();
  setupProvider();
  setupRepository();
  setupUseCase();
  setupMobx();
}

void setupClient() {
  final client = ClientFactory.baseClient!;

  client.options.followRedirects = false;
  client.options.connectTimeout = 10 * 1000;
  client.options.receiveTimeout = 10 * 2000;
}

void setupProvider() {
  sl.registerLazySingleton<DataBaseProvider>(
    () => DataBaseProviderImpl(),
    dispose: (_) => sl.resetLazySingleton<DataBaseProvider>(),
  );

  sl.registerLazySingleton<ServiceProvider>(
    () => ServiceProviderImpl(
      client: ClientFactory.baseClient!,
      dbController: sl<DbController>(),
    ),
    dispose: (_) => sl.resetLazySingleton<ServiceProvider>(),
  );
}

void setupRepository() {
  sl.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(
      serviceProvider: sl<ServiceProvider>(),
    ),
    dispose: (_) => sl.resetLazySingleton<ServiceRepository>(),
  );

  sl.registerLazySingleton<DataBaseRepository>(
    () => DataBaseRepositoryImpl(
      dataBaseProvider: sl<DataBaseProvider>(),
    ),
    dispose: (_) => sl.resetLazySingleton<DataBaseRepository>(),
  );
}

void setupUseCase() {
  sl.registerLazySingleton<SearchCEPUseCase>(
    () => SearchCEPUseCase(
      serviceRepository: sl<ServiceRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<SearchCEPUseCase>(),
  );

  sl.registerLazySingleton<GetCEPListUseCase>(
    () => GetCEPListUseCase(
      serviceRepository: sl<ServiceRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<GetCEPListUseCase>(),
  );

  sl.registerLazySingleton<SaveCEPListUseCase>(
    () => SaveCEPListUseCase(
      serviceRepository: sl<ServiceRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<SaveCEPListUseCase>(),
  );

  sl.registerLazySingleton<DeleteCEPListUseCase>(
    () => DeleteCEPListUseCase(
      serviceRepository: sl<ServiceRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<DeleteCEPListUseCase>(),
  );

  sl.registerLazySingleton<AddStorageUseCase>(
    () => AddStorageUseCase(
      dataBaseRepository: sl<DataBaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<AddStorageUseCase>(),
  );

  sl.registerLazySingleton<DeleteStorageUseCase>(
    () => DeleteStorageUseCase(
      dataBaseRepository: sl<DataBaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<DeleteStorageUseCase>(),
  );

  sl.registerLazySingleton<GetStorageUseCase>(
    () => GetStorageUseCase(
      dataBaseRepository: sl<DataBaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<GetStorageUseCase>(),
  );

  sl.registerLazySingleton<PutStorageUseCase>(
    () => PutStorageUseCase(
      dataBaseRepository: sl<DataBaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<PutStorageUseCase>(),
  );
}

setupMobx() {
  sl.registerLazySingleton<DbController>(
    () => DbController(
      addStorageUseCase: sl<AddStorageUseCase>(),
      deleteStorageUseCase: sl<DeleteStorageUseCase>(),
      getStorageUseCase: sl<GetStorageUseCase>(),
      putStorageUseCase: sl<PutStorageUseCase>(),
    ),
    dispose: (_) => sl.resetLazySingleton<DbController>(),
  );

  sl.registerLazySingleton<SplashStore>(
    () => SplashStore(),
    dispose: (_) => sl.resetLazySingleton<SplashStore>(),
  );

  sl.registerLazySingleton<NavigationController>(
    () => NavigationController(),
    dispose: (_) => sl.resetLazySingleton<NavigationController>(),
  );

  sl.registerLazySingleton<CityController>(
    () => CityController(
      searchCEPUseCase: sl<SearchCEPUseCase>(),
      saveCEPListUseCase: sl<SaveCEPListUseCase>(),
      getCEPListUseCase: sl<GetCEPListUseCase>(),
      deleteCEPListUseCase: sl<DeleteCEPListUseCase>(),
    ),
    dispose: (_) => sl.resetLazySingleton<CityController>(),
  );
}
