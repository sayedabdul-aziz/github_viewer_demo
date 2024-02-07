part of 'repos_bloc.dart';

abstract class ReposState extends Equatable {
  const ReposState();

  @override
  List<Object> get props => [];
}

class ReposInitial extends ReposState {}

class LoadingReposState extends ReposState {}

class LoadedReposState extends ReposState {
  final List<Repo> repos;

  const LoadedReposState({required this.repos});

  @override
  List<Object> get props => repos;
}

class ErrorReposState extends ReposState {
  final String message;

  const ErrorReposState({required this.message});

  @override
  List<Object> get props => [message];
}
