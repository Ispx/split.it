import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class ButtomStepsWidget extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final bool isEnable;
  final bool? enablegreenColor;
  ButtomStepsWidget(
      {required this.onTap,
      required this.title,
      this.isEnable = true,
      this.enablegreenColor = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => isEnable == true ? this.onTap!() : null,
      child: Text(
        this.title!,
        style: isEnable == true
            ? this.enablegreenColor == false
                ? AppTextStyle.instance.titleButtomEnableSteps
                : AppTextStyle.instance.titleButtomEnableSteps
                    .copyWith(color: Colors.green)
            : AppTextStyle.instance.titleButtomDisableSteps,
      ),
    );
  }
}
