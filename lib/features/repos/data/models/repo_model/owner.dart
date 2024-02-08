import 'package:hive/hive.dart';

part 'owner.g.dart';

@HiveType(typeId: 1)
class Owner {
  @HiveField(0)
  final String login;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String nodeId;

  @HiveField(3)
  final String avatarUrl;

  @HiveField(4)
  final String gravatarId;

  @HiveField(5)
  final String url;

  @HiveField(6)
  final String htmlUrl;

  @HiveField(7)
  final String followersUrl;

  @HiveField(8)
  final String followingUrl;

  @HiveField(9)
  final String gistsUrl;

  @HiveField(10)
  final String starredUrl;

  @HiveField(11)
  final String subscriptionsUrl;

  @HiveField(12)
  final String organizationsUrl;

  @HiveField(13)
  final String reposUrl;

  @HiveField(14)
  final String eventsUrl;

  @HiveField(15)
  final String receivedEventsUrl;

  @HiveField(16)
  final String type;

  @HiveField(17)
  final bool siteAdmin;

  Owner({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json['login'] as String,
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        avatarUrl: json['avatar_url'] as String,
        gravatarId: json['gravatar_id'] as String,
        url: json['url'] as String,
        htmlUrl: json['html_url'] as String,
        followersUrl: json['followers_url'] as String,
        followingUrl: json['following_url'] as String,
        gistsUrl: json['gists_url'] as String,
        starredUrl: json['starred_url'] as String,
        subscriptionsUrl: json['subscriptions_url'] as String,
        organizationsUrl: json['organizations_url'] as String,
        reposUrl: json['repos_url'] as String,
        eventsUrl: json['events_url'] as String,
        receivedEventsUrl: json['received_events_url'] as String,
        type: json['type'] as String,
        siteAdmin: json['site_admin'] as bool,
      );
}
