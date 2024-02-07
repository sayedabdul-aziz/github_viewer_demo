import 'package:get_it/get_it.dart';
import 'package:github_viewer_demo/features/repos/data/data_sources/repos_remote_ds.dart';
import 'package:github_viewer_demo/features/repos/domain/use_cases/get_all_repos.dart';
import 'package:github_viewer_demo/features/repos/presentation/view-model/repos_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Bloc

  sl.registerFactory(() => ReposBloc(getAllReposUseCase: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllReposUseCase(sl()));

// Datasources

  sl.registerLazySingleton<ReposRemoteDataSource>(
      () => ReposRemoteDataSourceImpl(client: sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
