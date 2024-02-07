import 'package:dartz/dartz.dart';
import 'package:github_viewer_demo/features/repos/domain/repo/github_viewer_repo.dart';

import '../../../../core/error/failure.dart';
import '../entities/repo.dart';

class GetAllReposUseCase {
  final GithubViewerRepo repo;

  GetAllReposUseCase(this.repo);

  Future<Either<Failure, List<Repo>>> call() async {
    return await repo.getAllRepos();
  }
}
