import 'package:codelytic/data/datasource/local/shared_preference_data_source_impl.dart';
import 'package:codelytic/data/datasource/network/quiz/quiz_remote_data_source_impl.dart';
import 'package:codelytic/data/repositories/auth_repositories_impl.dart';
import 'package:codelytic/data/repositories/task_repositories.dart';
import 'package:codelytic/domain/repositories/quiz_repositories.dart';
import 'package:codelytic/domain/repositories/task_repositories.dart';
import 'package:codelytic/domain/repositories/auth_repositories.dart';
import 'package:codelytic/domain/usecase/authentication/auth_usecase.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/home/home_bloc.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:codelytic/presentation/bloc/room/room_bloc.dart';
import 'package:codelytic/presentation/bloc/student/student_bloc.dart';
import 'package:codelytic/presentation/bloc/task/task_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/network/materi/materi_remote_data_source_impl.dart';
import 'data/datasource/network/remote_data_source_impl.dart';
import 'data/datasource/network/room/room_remote_data_source_impl.dart';
import 'data/datasource/network/student/student_remote_data_source_impl.dart';
import 'data/datasource/network/task/task_remote_data_source_impl.dart';
import 'data/repositories/home_repositories.dart';
import 'data/repositories/materi_repositories.dart';
import 'data/repositories/quiz_repositories.dart';
import 'data/repositories/room_repositories.dart';
import 'data/repositories/student_repositories.dart';
import 'domain/repositories/home_repositories.dart';
import 'domain/repositories/materi_repositories.dart';
import 'domain/repositories/room_repositories.dart';
import 'domain/repositories/student_repositories.dart';
import 'domain/usecase/home/home_usecase.dart';
import 'domain/usecase/materi/materi_usecase.dart';
import 'domain/usecase/quiz/quiz_usecase.dart';
import 'domain/usecase/room/room_usecase.dart';
import 'domain/usecase/student/student_usecase.dart';
import 'domain/usecase/task/task_usecase.dart';

final locator = GetIt.instance;
void init(){
  // bloc
  locator.registerFactory(() => AuthBloc(locator()));
  locator.registerFactory(() => HomeBloc(locator()));
  locator.registerFactory(() => MateriBloc(locator()));
  locator.registerFactory(() => QuizBloc(locator()));
  locator.registerFactory(() => RoomBloc(locator()));
  locator.registerFactory(() => StudentBloc(locator()));
  locator.registerFactory(() => TaskBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => AuthUsecase(locator()));
  locator.registerLazySingleton(() => HomeUsecase(locator()));
  locator.registerLazySingleton(() => MateriUsecase(locator()));
  locator.registerLazySingleton(() => QuizUsecase(locator()));
  locator.registerLazySingleton(() => RoomUsecase(locator()));
  locator.registerLazySingleton(() => StudentUsecase(locator()));
  locator.registerLazySingleton(() => TaskUsecase(locator()));

  // repository
  locator.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl(remoteDataSourceImpl: locator(), sharedPreferencesDataSourceImpl: locator()));
  locator.registerLazySingleton<HomeRepositories>(() => HomeRepositoriesImpl(remoteDataSourceImpl: locator(), sharedPreferencesDataSourceImpl: locator()));
  locator.registerLazySingleton<MateriRepositories>(() => MateriRepositoriesImpl(materiRemoteDataSourceImpl: locator(), sharedPreferencesDataSourceImpl: locator()));
  locator.registerLazySingleton<RoomRepositories>(() => RoomRepositoriesImpl(roomRemoteDataSourceImpl: locator()));
  locator.registerLazySingleton<QuizRepositories>(() => QuizRepositoriesImpl(quizRemoteDataSourceImpl: locator()));
  locator.registerLazySingleton<StudentRepositories>(() => StudentRepositoriesImpl(studentRemoteDataSourceImpl: locator()));
  locator.registerLazySingleton<TaskRepositories>(() => TaskRepositoriesImpl(taskRemoteDataSourceImpl: locator()));
  locator.registerLazySingleton<SharedPreferencesDataSourceImpl>(() => SharedPreferencesDataSourceImpl());

  // data source
  locator.registerFactory(() => RemoteDataSourceImpl(dio: locator(),client: locator()));
  locator.registerFactory(() => MateriRemoteDataSourceImpl(dio: locator(),client: locator()));
  locator.registerFactory(() => QuizRemoteDataSourceImpl(dio: locator(),client: locator()));
  locator.registerFactory(() => RoomRemoteDataSourceImpl(dio: locator(),client: locator()));
  locator.registerFactory(() => StudentRemoteDataSourceImpl(dio: locator(),client: locator()));
  locator.registerFactory(() => TaskRemoteDataSourceImpl(dio: locator(),client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingletonAsync<SharedPreferences>(() => locator());
  locator.registerLazySingleton(() => Dio());
}