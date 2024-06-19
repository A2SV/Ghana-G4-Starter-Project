import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/cubits/app_user/app_user_cubit.dart';
import 'package:starter_project/src/core/network/network.dart';

import '../../features/auth/authentication.dart';

final dpLocator = GetIt.instance;

Future<void> dpLocatorInit() async {}

Future<void> initDependencies() async {
  _initAuth();
  // Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  // dpLocator.registerLazySingleton(
  //   () => Hive.box(name: 'blogs'),
  // );
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox(Constants.authBox);
  dpLocator.registerLazySingleton(() => http.Client());

  dpLocator.registerFactory(() => InternetConnectionChecker());
  // core
  dpLocator.registerLazySingleton(
    () => AppUserCubit(),
  );
  dpLocator.registerLazySingleton<Network>(
    () => NetworkImpl(
      dpLocator(),
    ),
  );
}

void _initAuth() {
  // Datasource
  dpLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        client: dpLocator(),
      ),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: dpLocator(),
        network: dpLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => RegisterUseCase(
        authRepository: dpLocator(),
      ),
    )
    ..registerFactory(
      () => LoginUseCase(
        authRepository: dpLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        registerUseCase: dpLocator(),
        loginUseCase: dpLocator(),
        appUserCubit: dpLocator(),
      ),
    );
}
