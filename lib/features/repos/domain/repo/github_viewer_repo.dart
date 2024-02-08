import 'package:dartz/dartz.dart';
import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';

import '../../../../core/error/failure.dart';

abstract class GithubViewerRepo {
  Future<Either<Failure, List<Repo>>> getAllRepos();
  Future<Either<Failure, Repo>> getRepoDetails(String path);
}
