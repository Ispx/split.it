import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class InputFieldStepsWidget extends StatefulWidget {
  final String? hintText;
  final Widget? sufix;
  final Widget? prefix;
  final TextAlign textAlign;
  final void Function(String e)? onFuncion;
  InputFieldStepsWidget(
      {@required this.hintText,
      this.textAlign = TextAlign.center,
      this.sufix,
      this.prefix,
      this.onFuncion});

  @override
  _InputFieldStepsWidgetState createState() => _InputFieldStepsWidgetState();
}

class _InputFieldStepsWidgetState extends State<InputFieldStepsWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: widget.textAlign,
      onChanged: widget.onFuncion,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyle.instance.hintTextFieldStepOne,
      ),
    );
  }
}
