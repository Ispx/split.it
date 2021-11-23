import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class TitleSubtitleStpesWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  TitleSubtitleStpesWidget({@required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$title\n',
        style: AppTextStyle.instance.titleStepOne,
        children: [
          TextSpan(
            text: this.subtitle,
            style: AppTextStyle.instance.subTitleStepOne,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
