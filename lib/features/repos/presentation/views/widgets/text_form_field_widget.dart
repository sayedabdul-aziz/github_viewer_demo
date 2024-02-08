import 'package:flutter/material.dart';
import 'package:github_viewer_demo/core/util/app_text_styles.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;
  const TextFormFieldWidget({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: getbodyStyle(color: Theme.of(context).primaryColorDark),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search for repository",
            hintStyle: getbodyStyle(color: Theme.of(context).primaryColorDark)),
        onChanged: onChanged,
      ),
    );
  }
}
