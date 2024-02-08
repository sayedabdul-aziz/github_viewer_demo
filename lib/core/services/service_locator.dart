import 'package:get_it/get_it.dart';
import 'package:github_viewer_demo/core/network/check_internet.dart';
import 'package:github_viewer_demo/features/repos/data/data_sources/repos_local_ds.dart';
import 'package:github_viewer_demo/features/repos/data/data_sources/repos_remote_ds.dart';
import 'package:github_viewer_demo/features/repos/data/repo/github_repo_impl.dart';
import 'package:github_viewer_demo/features/repos/domain/repo/github_viewer_repo.dart';
import 'package:github_viewer_demo/features/repos/domain/use_cases/get_all_repos.dart';
import 'package:github_viewer_demo/features/repos/presentation/view-model/repos_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Bloc

  sl.registerFactory(() => ReposBloc(getAllReposUseCase: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllReposUseCase(sl()));

// Repository

  sl.registerLazySingleton<GithubViewerRepo>(() => GithubViewerRepoImpl(
      remotereposdata: sl(), localeDataSource: sl(), checkInternet: sl()));
// Datasources
  sl.registerLazySingleton<ReposRemoteDataSource>(
      () => ReposRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ReposLocaleDataSource>(
      () => ReposLocaleDataSourceImpl(pref: sl()));

//! Core

  sl.registerLazySingleton<CheckInternet>(() => checkInternetImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
