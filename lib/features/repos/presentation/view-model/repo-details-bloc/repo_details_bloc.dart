import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_viewer_demo/core/error/failure.dart';
import 'package:github_viewer_demo/core/strings/strings.dart';
import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';
import 'package:github_viewer_demo/features/repos/domain/use_cases/get_repo_details.dart';

part 'repo_details_event.dart';
part 'repo_details_state.dart';

class RepoDetailsBloc extends Bloc<RepoDeatilsEvent, RepoDetailsState> {
  final GetRepoDetailsUseCase getRepoDetailsUseCase;
  RepoDetailsBloc({required this.getRepoDetailsUseCase})
      : super(RepoDetailsInitial()) {
    on<RepoDeatilsEvent>((event, emit) async {
      if (event is GetRepoDeatilsEvent) {
        emit(LoadingRepoDetailsState());
        final repo = await getRepoDetailsUseCase(event.path);
        emit(_mapEithertoState(repo));
      }
    });
  }
  RepoDetailsState _mapEithertoState(Either<Failure, Repo> repo) {
    return repo.fold(
        (failure) => ErrorRepoDetailsState(message: _failureToMessage(failure)),
        (repo) => LoadedRepoDetailsState(repo: repo));
  }

  String _failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.SERVER_FAILURE_MESSAGE;
      case InternetFailure:
        return AppStrings.INTERNET_FAILURE_MESSAGE;
      default:
        return 'Unexpected Failure, Plz Try Again !!';
    }
  }
}
