import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:github_viewer_demo/core/util/app_text_styles.dart';
import 'package:github_viewer_demo/core/widgets/snackbar_message.dart';
import 'package:github_viewer_demo/features/repos/domain/entities/repo.dart';
import 'package:github_viewer_demo/features/repos/presentation/view-model/all-repos-bloc/repos_bloc.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/message_show_widget.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/repo_card_widget.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/text_form_field_widget.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/widgets/toggle_theme_widget.dart';

import '../../../../core/widgets/loading_widget.dart';

class GitHubViewerView extends StatefulWidget {
  const GitHubViewerView({Key? key}) : super(key: key);

  @override
  State<GitHubViewerView> createState() => _GitHubViewerViewState();
}

class _GitHubViewerViewState extends State<GitHubViewerView> {
  final ScrollController _scrollController = ScrollController();
  List<Repo> repos = [];
  List<Repo> searchrepos = [];
  bool isLoading = false;
  int page = 0;

  getRepos() {
    context.read<ReposBloc>().add(GetAllReposEvent());
  }

  getMoreRepos() {
    // Add a sublist of repos to the searchrepos list
    setState(() {
      searchrepos.addAll(
          repos.sublist(page * 10, _calculateEndIndex(10, repos.length, 10)));
    });
    // Increment the page number for the next pagination
    page++;
  }

  // calculate the end index of repos list
  int _calculateEndIndex(int currentPage, int totalItems, int itemsPerPage) {
    final endIndex = currentPage * itemsPerPage + itemsPerPage;
    return endIndex >= totalItems ? totalItems : endIndex;
  }

  @override
  void initState() {
    getRepos();
    // note that, The pagination is not necessary in terms of use in this case
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        getMoreRepos();
      }
    });
    super.initState();
  }

  searchRepos(String query) {
    setState(() {
      searchrepos = repos
          .where((item) =>
              (item.auther.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

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
              repos = state.repos;
              if (!isLoading) {
                searchrepos = state.repos.sublist(page * 10, page * 10 + 10);
                page++;
                isLoading = true;
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      onChanged: (value) {
                        searchRepos(value);
                      },
                    ),
                    const Gap(15),
                    (searchrepos.isEmpty)
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off_rounded,
                                  size: 80,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const Gap(30),
                                Text(
                                  "There is no repositories with this name.",
                                  textAlign: TextAlign.center,
                                  style: getbodyStyle(
                                      color:
                                          Theme.of(context).primaryColorDark),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              controller: _scrollController,
                              itemCount: searchrepos.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return RepoCardWidget(
                                  repo: searchrepos[index],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Gap(8),
                            ),
                          ),
                  ],
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
