import 'package:dartz/dartz.dart';
import 'package:github_viewer_demo/features/repos/domain/repo/github_viewer_repo.dart';

import '../../../../core/error/failure.dart';
import '../entities/repo.dart';

class GetRepoDetailsUseCase {
  final GithubViewerRepo repo;

  GetRepoDetailsUseCase(this.repo);

  Future<Either<Failure, Repo>> call(String path) async {
    return await repo.getRepoDetails(path);
  }
}
