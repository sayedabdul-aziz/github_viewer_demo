import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';

import 'owner.dart';

class RepoModel extends Repo {
  @override
  final int id;
  final String? nodeId;
  @override
  final String name;
  final String? fullName;
  final bool? private;
  final Owner? owner;
  final String? htmlUrl;
  final String? desc;
  final bool? fork;
  @override
  final String url;
  final String? forksUrl;
  final String? keysUrl;
  final String? collaboratorsUrl;
  final String? teamsUrl;
  final String? hooksUrl;
  final String? issueEventsUrl;
  final String? eventsUrl;
  final String? assigneesUrl;
  final String? branchesUrl;
  final String? tagsUrl;
  final String? blobsUrl;
  final String? gitTagsUrl;
  final String? gitRefsUrl;
  final String? treesUrl;
  final String? statusesUrl;
  final String? languagesUrl;
  final String? stargazersUrl;
  final String? contributorsUrl;
  final String? subscribersUrl;
  final String? subscriptionUrl;
  final String? commitsUrl;
  final String? gitCommitsUrl;
  final String? commentsUrl;
  final String? issueCommentUrl;
  final String? contentsUrl;
  final String? compareUrl;
  final String? mergesUrl;
  final String? archiveUrl;
  final String? downloadsUrl;
  @override
  final String issuesUrl;
  final String? pullsUrl;
  final String? milestonesUrl;
  final String? notificationsUrl;
  final String? labelsUrl;
  final String? releasesUrl;
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'node_id': nodeId,
        'name': name,
        'full_name': fullName,
        'private': private,
        'owner': owner!.toJson(),
        'html_url': htmlUrl,
        'description': description,
        'fork': fork,
        'url': url,
        'forks_url': forksUrl,
        'keys_url': keysUrl,
        'collaborators_url': collaboratorsUrl,
        'teams_url': teamsUrl,
        'hooks_url': hooksUrl,
        'issue_events_url': issueEventsUrl,
        'events_url': eventsUrl,
        'assignees_url': assigneesUrl,
        'branches_url': branchesUrl,
        'tags_url': tagsUrl,
        'blobs_url': blobsUrl,
        'git_tags_url': gitTagsUrl,
        'git_refs_url': gitRefsUrl,
        'trees_url': treesUrl,
        'statuses_url': statusesUrl,
        'languages_url': languagesUrl,
        'stargazers_url': stargazersUrl,
        'contributors_url': contributorsUrl,
        'subscribers_url': subscribersUrl,
        'subscription_url': subscriptionUrl,
        'commits_url': commitsUrl,
        'git_commits_url': gitCommitsUrl,
        'comments_url': commentsUrl,
        'issue_comment_url': issueCommentUrl,
        'contents_url': contentsUrl,
        'compare_url': compareUrl,
        'merges_url': mergesUrl,
        'archive_url': archiveUrl,
        'downloads_url': downloadsUrl,
        'issues_url': issuesUrl,
        'pulls_url': pullsUrl,
        'milestones_url': milestonesUrl,
        'notifications_url': notificationsUrl,
        'labels_url': labelsUrl,
        'releases_url': releasesUrl,
        'deployments_url': deploymentsUrl,
      };
}
