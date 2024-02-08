import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:github_viewer_demo/core/error/exceptions.dart';
import 'package:github_viewer_demo/core/strings/strings.dart';
import 'package:github_viewer_demo/features/repos/data/models/repo_model/repo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ReposLocaleDataSource {
  Future<List<RepoModel>> getCachedRepos();
  Future<Unit> cacheRepos(List<RepoModel> repos);
}

class ReposLocaleDataSourceImpl implements ReposLocaleDataSource {
  final SharedPreferences pref;

  ReposLocaleDataSourceImpl({required this.pref});

  @override
  Future<Unit> cacheRepos(List<RepoModel> reposModels) {
    List reposModelToJson = reposModels
        .map<Map<String, dynamic>>((reposModel) => reposModel.toJson())
        .toList();
    pref.setString(AppStrings.CACHED_REPOS, json.encode(reposModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<RepoModel>> getCachedRepos() {
    var jsonString = pref.getString(AppStrings.CACHED_REPOS);
    if (jsonString != null) {
      List decodedData = json.decode(jsonString);
      List<RepoModel> jsonTorepoModel = decodedData
          .map<RepoModel>((repos) => RepoModel.fromJson(repos))
          .toList();
      return Future.value(jsonTorepoModel);
    } else {
      throw EmptyCachedException();
    }
  }

  
}
