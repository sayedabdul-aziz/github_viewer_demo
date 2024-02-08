import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_viewer_demo/core/services/service_locator.dart' as di;
import 'package:github_viewer_demo/core/themes/app_theme.dart';
import 'package:github_viewer_demo/core/themes/cubit/theme_cubit.dart';
import 'package:github_viewer_demo/core/themes/cubit/theme_state.dart';
import 'package:github_viewer_demo/core/util/routers.dart';
import 'package:github_viewer_demo/features/repos/presentation/view-model/all-repos-bloc/repos_bloc.dart';

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
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(create: (_) => di.sl<ReposBloc>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          bool isDark = context.read<ThemeCubit>().isDark;
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: isDark ? darkTheme : lightTheme,
          );
        }));
  }
}
