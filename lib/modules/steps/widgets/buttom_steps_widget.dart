import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class ButtomStepsWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  ButtomStepsWidget({
    @required this.onTap,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: this.onTap,
        child: Text(
          this.title!,
          style: AppTextStyle.instance.titleButtomSteps,
        ));
  }
}
