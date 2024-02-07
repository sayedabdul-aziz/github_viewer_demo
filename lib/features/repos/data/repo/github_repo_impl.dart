import 'package:dartz/dartz.dart';
import 'package:github_viewer_demo/core/error/exceptions.dart';
import 'package:github_viewer_demo/core/error/failure.dart';
import 'package:github_viewer_demo/features/repos/data/data_sources/repos_remote_ds.dart';
import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';
import 'package:github_viewer_demo/features/repos/domain/repo/github_viewer_repo.dart';

class GithubViewerRepoImpl implements GithubViewerRepo {
  final ReposRemoteDataSource remotereposdata;

  GithubViewerRepoImpl({
    required this.remotereposdata,
  });

  @override
  Future<Either<Failure, List<Repo>>> getAllRepos() async {
    try {
      var remoteRepos = await remotereposdata.getAllRepos();
      return Right(remoteRepos);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
