// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoModelAdapter extends TypeAdapter<RepoModel> {
  @override
  final int typeId = 0;

  @override
  RepoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepoModel(
      id: fields[0] as int,
      nodeId: fields[1] as String?,
      name: fields[2] as String,
      fullName: fields[3] as String?,
      private: fields[4] as bool?,
      owner: fields[5] as Owner?,
      htmlUrl: fields[6] as String?,
      desc: fields[7] as String?,
      fork: fields[8] as bool?,
      url: fields[9] as String,
      forksUrl: fields[10] as String?,
      keysUrl: fields[11] as String?,
      collaboratorsUrl: fields[12] as String?,
      teamsUrl: fields[13] as String?,
      hooksUrl: fields[14] as String?,
      issueEventsUrl: fields[15] as String?,
      eventsUrl: fields[16] as String?,
      assigneesUrl: fields[17] as String?,
      branchesUrl: fields[18] as String?,
      tagsUrl: fields[19] as String?,
      blobsUrl: fields[20] as String?,
      gitTagsUrl: fields[21] as String?,
      gitRefsUrl: fields[22] as String?,
      treesUrl: fields[23] as String?,
      statusesUrl: fields[24] as String?,
      languagesUrl: fields[25] as String?,
      stargazersUrl: fields[26] as String?,
      contributorsUrl: fields[27] as String?,
      subscribersUrl: fields[28] as String?,
      subscriptionUrl: fields[29] as String?,
      commitsUrl: fields[30] as String?,
      gitCommitsUrl: fields[31] as String?,
      commentsUrl: fields[32] as String?,
      issueCommentUrl: fields[33] as String?,
      contentsUrl: fields[34] as String?,
      compareUrl: fields[35] as String?,
      mergesUrl: fields[36] as String?,
      archiveUrl: fields[37] as String?,
      downloadsUrl: fields[38] as String?,
      issuesUrl: fields[39] as String,
      pullsUrl: fields[40] as String?,
      milestonesUrl: fields[41] as String?,
      notificationsUrl: fields[42] as String?,
      labelsUrl: fields[43] as String?,
      releasesUrl: fields[44] as String?,
      deploymentsUrl: fields[45] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RepoModel obj) {
    writer
      ..writeByte(46)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nodeId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.private)
      ..writeByte(5)
      ..write(obj.owner)
      ..writeByte(6)
      ..write(obj.htmlUrl)
      ..writeByte(7)
      ..write(obj.desc)
      ..writeByte(8)
      ..write(obj.fork)
      ..writeByte(9)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.forksUrl)
      ..writeByte(11)
      ..write(obj.keysUrl)
      ..writeByte(12)
      ..write(obj.collaboratorsUrl)
      ..writeByte(13)
      ..write(obj.teamsUrl)
      ..writeByte(14)
      ..write(obj.hooksUrl)
      ..writeByte(15)
      ..write(obj.issueEventsUrl)
      ..writeByte(16)
      ..write(obj.eventsUrl)
      ..writeByte(17)
      ..write(obj.assigneesUrl)
      ..writeByte(18)
      ..write(obj.branchesUrl)
      ..writeByte(19)
      ..write(obj.tagsUrl)
      ..writeByte(20)
      ..write(obj.blobsUrl)
      ..writeByte(21)
      ..write(obj.gitTagsUrl)
      ..writeByte(22)
      ..write(obj.gitRefsUrl)
      ..writeByte(23)
      ..write(obj.treesUrl)
      ..writeByte(24)
      ..write(obj.statusesUrl)
      ..writeByte(25)
      ..write(obj.languagesUrl)
      ..writeByte(26)
      ..write(obj.stargazersUrl)
      ..writeByte(27)
      ..write(obj.contributorsUrl)
      ..writeByte(28)
      ..write(obj.subscribersUrl)
      ..writeByte(29)
      ..write(obj.subscriptionUrl)
      ..writeByte(30)
      ..write(obj.commitsUrl)
      ..writeByte(31)
      ..write(obj.gitCommitsUrl)
      ..writeByte(32)
      ..write(obj.commentsUrl)
      ..writeByte(33)
      ..write(obj.issueCommentUrl)
      ..writeByte(34)
      ..write(obj.contentsUrl)
      ..writeByte(35)
      ..write(obj.compareUrl)
      ..writeByte(36)
      ..write(obj.mergesUrl)
      ..writeByte(37)
      ..write(obj.archiveUrl)
      ..writeByte(38)
      ..write(obj.downloadsUrl)
      ..writeByte(39)
      ..write(obj.issuesUrl)
      ..writeByte(40)
      ..write(obj.pullsUrl)
      ..writeByte(41)
      ..write(obj.milestonesUrl)
      ..writeByte(42)
      ..write(obj.notificationsUrl)
      ..writeByte(43)
      ..write(obj.labelsUrl)
      ..writeByte(44)
      ..write(obj.releasesUrl)
      ..writeByte(45)
      ..write(obj.deploymentsUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
