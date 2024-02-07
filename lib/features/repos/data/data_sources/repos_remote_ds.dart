import 'dart:convert';

import 'package:github_viewer_demo/core/error/exceptions.dart';
import 'package:github_viewer_demo/core/strings/strings.dart';
import 'package:github_viewer_demo/features/repos/data/models/repo_model/repo_model.dart';
import 'package:http/http.dart' as http;

abstract class ReposRemoteDataSource {
  Future<List<RepoModel>> getAllRepos();
}

class ReposRemoteDataSourceImpl implements ReposRemoteDataSource {
  final http.Client client;

  ReposRemoteDataSourceImpl({required this.client});
  @override
  Future<List<RepoModel>> getAllRepos() async {
    final response = await client.get(
      Uri.parse(BASE_URL + REPO_ENDPOINT),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final List decodeData = json.decode(response.body) as List;
      final List<RepoModel> repoModel = decodeData
          .map<RepoModel>((jsonData) => RepoModel.fromJson(jsonData))
          .toList();
      return Future.value(repoModel);
    } else {
      throw ServerException();
    }
  }
}
