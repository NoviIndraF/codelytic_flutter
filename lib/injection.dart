import 'package:codelytic/data/datasource/local/shared_preference_data_source_impl.dart';
import 'package:codelytic/data/repositories/auth_repositories_impl.dart';
import 'package:codelytic/domain/repositories/auth_repositories.dart';
import 'package:codelytic/domain/usecase/authentication/auth_usecase.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/home/home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/network/remote_data_source_impl.dart';
import 'data/repositories/home_repositories.dart';
import 'domain/repositories/home_repositories.dart';
import 'domain/usecase/home/home_usecase.dart';

final locator = GetIt.instance;
void init(){
  // bloc
  locator.registerFactory(() => AuthBloc(locator()));
  locator.registerFactory(() => HomeBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => AuthUsecase(locator()));
  locator.registerLazySingleton(() => HomeUsecase(locator()));

  // repository
  locator.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl(remoteDataSourceImpl: locator(), sharedPreferencesDataSourceImpl: locator()));
  locator.registerLazySingleton<HomeRepositories>(() => HomeRepositoriesImpl(remoteDataSourceImpl: locator(), sharedPreferencesDataSourceImpl: locator()));
  locator.registerLazySingleton<SharedPreferencesDataSourceImpl>(() => SharedPreferencesDataSourceImpl());

  // data source
  locator.registerFactory(() => RemoteDataSourceImpl(dio: locator(),client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingletonAsync<SharedPreferences>(() => locator());
  locator.registerLazySingleton(() => Dio());
}