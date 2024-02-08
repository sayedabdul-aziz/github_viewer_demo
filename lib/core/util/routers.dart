import 'package:github_viewer_demo/features/repos/presentation/views/repos_details_view.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/repos_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const gitHubViewerView = '/';
  static const gitHubViewerDetailsView = '/gitHubViewerDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const GitHubViewerView(),
      ),
      GoRoute(
        path: gitHubViewerDetailsView,
        builder: (context, state) {
          var path = state.extra as String;
          return GitHubViewerDetailsView(
            path: path,
          );
        },
      ),
    ],
  );
}
