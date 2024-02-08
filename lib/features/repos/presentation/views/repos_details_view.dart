import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:github_viewer_demo/core/services/service_locator.dart' as di;
import 'package:github_viewer_demo/core/util/app_text_styles.dart';
import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';
import 'package:github_viewer_demo/features/repos/presentation/view-model/repo-details-bloc/repo_details_bloc.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/details_item_widget.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/message_show_widget.dart';

class GitHubViewerDetailsView extends StatelessWidget {
  const GitHubViewerDetailsView({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor));
    return BlocProvider(
      create: (context) =>
          di.sl<RepoDetailsBloc>()..add(GetRepoDeatilsEvent(path: path)),
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
                di.sl<RepoDetailsBloc>()..add(GetRepoDeatilsEvent(path: path)),
            child: BlocBuilder<RepoDetailsBloc, RepoDetailsState>(
              builder: (context, state) {
                if (state is LoadedRepoDetailsState) {
                  Repo repo = state.repo;
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: RepoDetailsContent(repo: repo),
                  );
                } else if (state is ErrorRepoDetailsState) {
                  return const MessageShowWidget();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RepoDetailsContent extends StatelessWidget {
  const RepoDetailsContent({
    super.key,
    required this.repo,
  });

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              repo.name,
              style: getTitleStyle(
                  fontSize: 22, color: Theme.of(context).primaryColor),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star,
                    size: 18, color: Theme.of(context).primaryColorDark),
                const Gap(5),
                Text(repo.stars.toString(),
                    style: getbodyStyle(
                        color: Theme.of(context).primaryColorDark)),
              ],
            ),
          ],
        ),
        const Gap(15),
        DetailsItemWidget(
            title: 'Owner : ', text: repo.auther.split('/').first),
        const Gap(15),
        DetailsItemWidget(title: 'Watchers : ', text: repo.watchers.toString()),
        const Gap(15),
        DetailsItemWidget(
            title: 'Subscribers : ', text: repo.subscribers.toString()),
        const Gap(15),
        DetailsItemWidget(title: 'Forks : ', text: repo.forks.toString()),
        const Gap(15),
        DetailsItemWidget(
            title: 'Subscribers : ', text: repo.subscribers.toString()),
        const Gap(15),
        DetailsItemWidget(
            title: 'Created At : ', text: repo.createdAt.split('T').first),
        const Gap(15),
        DetailsItemWidget(
            title: 'Updated At : ', text: repo.updatedAt.split('T').first),
        const Gap(15),
        DetailsItemWidget(title: 'URL \n', text: repo.url),
        const Gap(15),
        DetailsItemWidget(title: 'Description \n', text: repo.description),
        const Gap(30),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).cardColor,
              ),
              onPressed: () {},
              child: Text(
                'View Issues',
                style: getbodyStyle(color: Theme.of(context).primaryColor),
              ))
        ])
      ],
    );
  }
}
