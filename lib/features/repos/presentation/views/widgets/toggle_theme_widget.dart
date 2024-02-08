import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:github_viewer_demo/core/themes/cubit/theme_cubit.dart';
import 'package:github_viewer_demo/core/themes/cubit/theme_state.dart';
import 'package:github_viewer_demo/core/util/app_colors.dart';

class ToggleThemeWidget extends StatelessWidget {
  const ToggleThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool isDark = context.read<ThemeCubit>().isDark;
        return Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: isDark ? AppColors.black : AppColors.cardColor),
          child: InkWell(
            onTap: () {
              context.read<ThemeCubit>().updateTheme(!isDark);
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor:
                      isDark ? AppColors.darkPrimaryColor : Colors.transparent,
                  child: Icon(
                    Icons.dark_mode_rounded,
                    color:
                        isDark ? AppColors.black : AppColors.lightPrimaryColor,
                    size: 17,
                  ),
                ),
                const Gap(10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor:
                      isDark ? Colors.transparent : AppColors.lightPrimaryColor,
                  child: Icon(
                    Icons.light_mode,
                    color:
                        isDark ? AppColors.darkPrimaryColor : AppColors.white,
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
