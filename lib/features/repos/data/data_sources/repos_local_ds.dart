import 'package:github_viewer_demo/core/error/exceptions.dart';
import 'package:github_viewer_demo/core/strings/strings.dart';
import 'package:github_viewer_demo/features/repos/data/models/repo_model/repo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ReposLocaleDataSource {
  Future<List<RepoModel>> getCachedRepos();
  Future<void> cacheRepos(List<RepoModel> repos);
}

class ReposLocaleDataSourceImpl implements ReposLocaleDataSource {
  final SharedPreferences pref;

  ReposLocaleDataSourceImpl({required this.pref});

  @override
  Future<void> cacheRepos(List<RepoModel> reposModels) async {
    final box = await Hive.openBox<RepoModel>(AppStrings.REPOS_BOX);

    await box.clear();
    for (var element in reposModels) {
      await box.put(element.id, element);
    }

    await box.close();
  }

  @override
  Future<List<RepoModel>> getCachedRepos() async {
    final box = await Hive.openBox<RepoModel>(AppStrings.REPOS_BOX);

    if (box.isNotEmpty) {
      return box.values.toList();
    } else {
      throw EmptyCachedException();
    }
  }
}
