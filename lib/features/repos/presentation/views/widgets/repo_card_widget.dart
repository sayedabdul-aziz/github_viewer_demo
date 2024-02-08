import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:github_viewer_demo/core/util/app_text_styles.dart';
import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';

class RepoCardWidget extends StatelessWidget {
  const RepoCardWidget({
    super.key,
    required this.repo,
  });

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repo.name,
            style: getTitleStyle(color: Theme.of(context).primaryColorLight),
          ),
          const Gap(5),
          Text(
            repo.auther.split('/').first,
            style: getbodyStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark),
          ),
          const Gap(10),
          Text(
            repo.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: getbodyStyle(
                color: Theme.of(context).primaryColorDark.withOpacity(.7)),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.star,
                  size: 18, color: Theme.of(context).primaryColorDark),
              const Gap(5),
              Text('unknown',
                  style:
                      getbodyStyle(color: Theme.of(context).primaryColorDark)),
            ],
          ),
        ],
      ),
    );
  }
}
