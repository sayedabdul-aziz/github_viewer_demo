import 'package:flutter/material.dart';
import 'package:github_viewer_demo/core/util/app_text_styles.dart';

class DetailsItemWidget extends StatelessWidget {
  const DetailsItemWidget({
    super.key,
    required this.text,
    required this.title,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(
            text: title,
            style: getbodyStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark),
          ),
          TextSpan(
              text: text,
              style: getbodyStyle(color: Theme.of(context).primaryColorDark)),
        ])),
      ],
    );
  }
}
