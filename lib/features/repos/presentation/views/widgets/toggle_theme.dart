import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:github_viewer_demo/core/themes/bloc/theme_bloc.dart';
import 'package:github_viewer_demo/core/themes/bloc/theme_event.dart';
import 'package:github_viewer_demo/core/themes/bloc/theme_state.dart';
import 'package:github_viewer_demo/core/util/app_colors.dart';

class ToggleThemeWidget extends StatelessWidget {
  const ToggleThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool isDark = state.isDarkTheme;
        return Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: AppColors.cardColor),
          child: InkWell(
            onTap: () {
              context.read<ThemeBloc>().add(ChangeTheme());
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor:
                      isDark ? AppColors.primaryColor : Colors.transparent,
                  child: Icon(
                    Icons.dark_mode_rounded,
                    color: isDark ? AppColors.white : AppColors.primaryColor,
                    size: 17,
                  ),
                ),
                const Gap(10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor:
                      isDark ? Colors.transparent : AppColors.primaryColor,
                  child: Icon(
                    Icons.light_mode,
                    color: isDark ? AppColors.primaryColor : AppColors.white,
                    size: 17,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
