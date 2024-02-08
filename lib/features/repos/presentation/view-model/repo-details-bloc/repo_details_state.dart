part of 'repo_details_bloc.dart';

abstract class RepoDetailsState extends Equatable {
  const RepoDetailsState();

  @override
  List<Object> get props => [];
}

class RepoDetailsInitial extends RepoDetailsState {}

class LoadingRepoDetailsState extends RepoDetailsState {}

class LoadedRepoDetailsState extends RepoDetailsState {
  final Repo repo;

  const LoadedRepoDetailsState({required this.repo});
}

class ErrorRepoDetailsState extends RepoDetailsState {
  final String message;

  const ErrorRepoDetailsState({required this.message});

  @override
  List<Object> get props => [message];
}
