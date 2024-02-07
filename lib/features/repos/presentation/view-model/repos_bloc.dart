import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_viewer_demo/core/error/failure.dart';
import 'package:github_viewer_demo/core/strings/strings.dart';
import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';
import 'package:github_viewer_demo/features/repos/domain/use_cases/get_all_repos.dart';

part 'repos_event.dart';
part 'repos_state.dart';

class ReposBloc extends Bloc<ReposEvent, ReposState> {
  final GetAllReposUseCase getAllReposUseCase;
  ReposBloc({required this.getAllReposUseCase}) : super(ReposInitial()) {
    on<ReposEvent>((event, emit) async {
      if (event is GetAllReposEvent) {
        emit(LoadingReposState());
        final repos = await getAllReposUseCase();
        emit(_mapEithertoState(repos));
      } else if (event is RefreshReposEvent) {
        emit(LoadingReposState());
        final repos = await getAllReposUseCase();
        emit(_mapEithertoState(repos));
      }
    });
  }
  ReposState _mapEithertoState(Either<Failure, List<Repo>> repos) {
    return repos.fold(
        (failure) => ErrorReposState(message: _FailureToMessage(failure)),
        (repos) => LoadedReposState(repos: repos));
  }

  String _FailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case InternetFailure:
        return INTERNET_FAILURE_MESSAGE;
      default:
        return 'Unexpected Failure, Plz Try Again !!';
    }
  }
}
