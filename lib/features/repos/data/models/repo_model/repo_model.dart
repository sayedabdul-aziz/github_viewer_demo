import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'owner.dart';
part 'repo_model.g.dart';

@HiveType(typeId: 0)
class RepoModel extends Repo {
  @override
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? nodeId;

  @override
  @HiveField(2)
  final String name;

  @HiveField(3)
  final String? fullName;

  @HiveField(4)
  final bool? private;

  @HiveField(5)
  final Owner? owner;

  @HiveField(6)
  final String? htmlUrl;

  @HiveField(7)
  final String? desc;

  @HiveField(8)
  final bool? fork;

  @override
  @HiveField(9)
  final String url;

  @HiveField(10)
  final String? forksUrl;

  @HiveField(11)
  final String? keysUrl;

  @HiveField(12)
  final String? collaboratorsUrl;
  @HiveField(13)
  final String? teamsUrl;
  @HiveField(14)
  final String? hooksUrl;
  @HiveField(15)
  final String? issueEventsUrl;
  @HiveField(16)
  final String? eventsUrl;
  @HiveField(17)
  final String? assigneesUrl;
  @HiveField(18)
  final String? branchesUrl;
  @HiveField(19)
  final String? tagsUrl;
  @HiveField(20)
  final String? blobsUrl;
  @HiveField(21)
  final String? gitTagsUrl;
  @HiveField(22)
  final String? gitRefsUrl;
  @HiveField(23)
  final String? treesUrl;
  @HiveField(24)
  final String? statusesUrl;
  @HiveField(25)
  final String? languagesUrl;
  @HiveField(26)
  final String? stargazersUrl;
  @HiveField(27)
  final String? contributorsUrl;
  @HiveField(28)
  final String? subscribersUrl;
  @HiveField(29)
  final String? subscriptionUrl;
  @HiveField(30)
  final String? commitsUrl;
  @HiveField(31)
  final String? gitCommitsUrl;
  @HiveField(32)
  final String? commentsUrl;
  @HiveField(33)
  final String? issueCommentUrl;
  @HiveField(34)
  final String? contentsUrl;
  @HiveField(35)
  final String? compareUrl;
  @HiveField(36)
  final String? mergesUrl;
  @HiveField(37)
  final String? archiveUrl;
  @HiveField(38)
  final String? downloadsUrl;
  @override
  @HiveField(39)
  final String issuesUrl;
  @HiveField(40)
  final String? pullsUrl;
  @HiveField(41)
  final String? milestonesUrl;
  @HiveField(42)
  final String? notificationsUrl;
  @HiveField(43)
  final String? labelsUrl;
  @HiveField(44)
  final String? releasesUrl;
  @HiveField(45)
  final String? deploymentsUrl;

  const RepoModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    this.desc,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
  }) : super(
            id: id,
            name: name,
            description: desc ?? '',
            issuesUrl: issuesUrl,
            forks: 0,
            url: url,
            auther: fullName ?? "",
            createdAt: '',
            updatedAt: '',
            stars: 0,
            watchers: 0,
            subscribers: 0);

  factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        fullName: json['full_name'] as String,
        private: json['private'] as bool,
        owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
        htmlUrl: json['html_url'] as String,
        desc: json['description'] as String?,
        fork: json['fork'] as bool,
        url: json['url'] as String,
        forksUrl: json['forks_url'] as String,
        keysUrl: json['keys_url'] as String,
        collaboratorsUrl: json['collaborators_url'] as String,
        teamsUrl: json['teams_url'] as String,
        hooksUrl: json['hooks_url'] as String,
        issueEventsUrl: json['issue_events_url'] as String,
        eventsUrl: json['events_url'] as String,
        assigneesUrl: json['assignees_url'] as String,
        branchesUrl: json['branches_url'] as String,
        tagsUrl: json['tags_url'] as String,
        blobsUrl: json['blobs_url'] as String,
        gitTagsUrl: json['git_tags_url'] as String,
        gitRefsUrl: json['git_refs_url'] as String,
        treesUrl: json['trees_url'] as String,
        statusesUrl: json['statuses_url'] as String,
        languagesUrl: json['languages_url'] as String,
        stargazersUrl: json['stargazers_url'] as String,
        contributorsUrl: json['contributors_url'] as String,
        subscribersUrl: json['subscribers_url'] as String,
        subscriptionUrl: json['subscription_url'] as String,
        commitsUrl: json['commits_url'] as String,
        gitCommitsUrl: json['git_commits_url'] as String,
        commentsUrl: json['comments_url'] as String,
        issueCommentUrl: json['issue_comment_url'] as String,
        contentsUrl: json['contents_url'] as String,
        compareUrl: json['compare_url'] as String,
        mergesUrl: json['merges_url'] as String,
        archiveUrl: json['archive_url'] as String,
        downloadsUrl: json['downloads_url'] as String,
        issuesUrl: json['issues_url'] as String,
        pullsUrl: json['pulls_url'] as String,
        milestonesUrl: json['milestones_url'] as String,
        notificationsUrl: json['notifications_url'] as String,
        labelsUrl: json['labels_url'] as String,
        releasesUrl: json['releases_url'] as String,
        deploymentsUrl: json['deployments_url'] as String,
      );
}
