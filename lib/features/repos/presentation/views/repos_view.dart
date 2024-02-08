import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_viewer_demo/core/widgets/snackbar_message.dart';
import 'package:github_viewer_demo/features/repos/presentation/view-model/all-repos-bloc/repos_bloc.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/message_show_widget.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/repo_card_widget.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/toggle_theme_widget.dart';

import '../../../../core/widgets/loading_widget.dart';

class GitHubViewerView extends StatelessWidget {
  const GitHubViewerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Viewer'),
        actions: const [
          ToggleThemeWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<ReposBloc, ReposState>(
          listener: (context, state) {
            if (state is ErrorReposState) {
              showErrorSnackBar(message: 'message', context: context);
            }
          },
          builder: (context, state) {
            if (state is LoadedReposState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RepoCardWidget(
                      repo: state.repos[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1),
                  itemCount: state.repos.length,
                ),
              );
            } else if (state is ErrorReposState) {
              return const MessageShowWidget();
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
