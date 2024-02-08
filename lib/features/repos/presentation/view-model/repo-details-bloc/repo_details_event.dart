part of 'repo_details_bloc.dart';

abstract class RepoDeatilsEvent extends Equatable {
  const RepoDeatilsEvent();

  @override
  List<Object> get props => [];
}

class GetRepoDeatilsEvent extends RepoDeatilsEvent {
  final String path;

  const GetRepoDeatilsEvent({required this.path});
}
