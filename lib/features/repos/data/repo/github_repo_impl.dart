import 'package:dartz/dartz.dart';
import 'package:github_viewer_demo/core/error/exceptions.dart';
import 'package:github_viewer_demo/core/error/failure.dart';
import 'package:github_viewer_demo/core/network/check_internet.dart';
import 'package:github_viewer_demo/features/repos/data/data_sources/repos_local_ds.dart';
import 'package:github_viewer_demo/features/repos/data/data_sources/repos_remote_ds.dart';
import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';
import 'package:github_viewer_demo/features/repos/domain/repo/github_viewer_repo.dart';

class GithubViewerRepoImpl implements GithubViewerRepo {
  final ReposRemoteDataSource remotereposdata;
  final ReposLocaleDataSource localeDataSource;
  final CheckInternet checkInternet;
  GithubViewerRepoImpl({
    required this.remotereposdata,
    required this.localeDataSource,
    required this.checkInternet,
  });

  @override
  Future<Either<Failure, List<Repo>>> getAllRepos() async {
    if (await checkInternet.isConnected) {
      try {
        // - get all repos and caching it to get it offline
        var remoteRepos = await remotereposdata.getAllRepos();
        localeDataSource.cacheRepos(remoteRepos);
        return Right(remoteRepos);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        var cachedPosts = await localeDataSource.getCachedRepos();
        return Right(cachedPosts);
      } on EmptyCachedException {
        return Left(CachedReposFailure());
      }
    }
  }
}
