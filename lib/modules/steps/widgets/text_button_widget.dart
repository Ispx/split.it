import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const TextButtonWidget(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Text(
        this.title,
        style: AppTextStyle.instance.titleTextButton,
      ),
    );
  }
}
