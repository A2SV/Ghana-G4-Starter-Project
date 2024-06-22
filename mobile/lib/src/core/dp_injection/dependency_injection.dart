import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/cubits/app_user/app_user_cubit.dart';
import 'package:starter_project/src/core/network/network.dart';
import 'package:starter_project/src/features/blog/data/data_sources/data_sources.dart';
import 'package:starter_project/src/features/blog/data/data_sources/tag_remote_data_source.dart';
import 'package:starter_project/src/features/blog/data/repositories/blog_repository_impl_b.dart';
import 'package:starter_project/src/features/blog/data/repositories/tag_repository_impl.dart';
import 'package:starter_project/src/features/blog/domain/repositories/repository.dart';
import 'package:starter_project/src/features/blog/domain/repositories/tag_repository.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/create_blog_use_case_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/delete_blog_use_case_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/update_blog_use_case_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/view_all_blogs_use_case.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/view_all_tags_use_case_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/view_blog_use_case.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/blog/blog_bloc.dart';

import '../../features/auth/authentication.dart';

final dpLocator = GetIt.instance;

Future<void> dpLocatorInit() async {}

Future<void> initDependencies() async {
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
  _initAuth();
  _initBlog();
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

void _initBlog() {
  // Datasource
  dpLocator
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(
        client: dpLocator(),
      ),
    )
    ..registerFactory<TagRemoteDataSource>(
      () => TagRemoteDataSourceImpl(
        client: dpLocator(),
      ),
    )
    // Repository
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(
        remoteDataSource: dpLocator(),
        network: dpLocator(),
      ),
    )
    ..registerFactory<TagRepository>(
      () => TagRepositoryImpl(
        remoteDataSource: dpLocator(),
        network: dpLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => CreateBlogUseCase(
        blogRepository: dpLocator(),
      ),
    )
    ..registerFactory(
      () => UpdateBlogUseCase(
        blogRepository: dpLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteBlogUseCase(
        blogRepository: dpLocator(),
      ),
    )
    ..registerFactory(
      () => ViewAllBlogUseCase(
        blogRepository: dpLocator(),
      ),
    )
    ..registerFactory(
      () => ViewBlogUseCase(
        blogRepository: dpLocator(),
      ),
    )
    ..registerFactory(
      () => ViewTagsUseCase(
        tagRepository: dpLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => BlogBloc(
        updateBlogUseCase: dpLocator(),
        createBlogUseCase: dpLocator(),
        deleteBlogUseCase: dpLocator(),
        viewAllBlogUseCase: dpLocator(),
        viewBlogUseCase: dpLocator(),
        viewTagsUseCase: dpLocator(),
      ),
    );
}
