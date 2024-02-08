import 'package:equatable/equatable.dart';

class Repo extends Equatable {
  final int id;
  final String name;
  final String description;
  final String auther;
  final String url;
  final int forks;
  final int watchers;
  final int stars;
  final int subscribers;
  final String updatedAt;
  final String createdAt;
  final String issuesUrl;

  const Repo({
    required this.id,
    required this.name,
    required this.description,
    required this.auther,
    required this.url,
    required this.forks,
    required this.subscribers,
    required this.updatedAt,
    required this.createdAt,
    required this.issuesUrl,
    required this.stars,
    required this.watchers,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      auther,
      url,
      forks,
      subscribers,
      updatedAt,
      createdAt,
      issuesUrl
    ];
  }
}
