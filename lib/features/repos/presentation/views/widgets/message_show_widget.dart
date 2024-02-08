import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:github_viewer_demo/core/strings/strings.dart';
import 'package:github_viewer_demo/core/util/app_colors.dart';
import 'package:github_viewer_demo/core/util/app_text_styles.dart';

class MessageShowWidget extends StatelessWidget {
  const MessageShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_connected_no_internet_4_rounded,
            size: 80,
            color: AppColors.lightPrimaryColor,
          ),
          const Gap(30),
          Text(
            INTERNET_FAILURE_MESSAGE,
            style: getbodyStyle(color: Theme.of(context).primaryColorLight),
          ),
        ],
      ),
    );
  }
}
