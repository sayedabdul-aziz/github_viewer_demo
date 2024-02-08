import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_viewer_demo/core/network/network-cubit/network_cubit.dart';
import 'package:github_viewer_demo/core/services/service_locator.dart' as di;
import 'package:github_viewer_demo/core/themes/app_theme.dart';
import 'package:github_viewer_demo/core/themes/bloc/theme_bloc.dart';
import 'package:github_viewer_demo/core/themes/bloc/theme_state.dart';
import 'package:github_viewer_demo/features/repos/presentation/view-model/repos_bloc.dart';
import 'package:github_viewer_demo/features/repos/presentation/views/repos_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
              create: (_) => di.sl<ReposBloc>()..add(GetAllReposEvent())),
          BlocProvider(
            create: (context) => InternetConnectionCubit()..checkConnectivity(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          state.getTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.isDarkTheme ? darkTheme : lightTheme,
            home: const GitHubViewerView(),
            // home: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
            //   builder: (context, state) {
            //     if (state is InternetConnectedState) {
            //       return const GitHubViewerView();
            //     } else {
            //       return const Scaffold(body: MessageShowWidget());
            //     }
            //   },
            // ),
          );
        }));
  }
}
