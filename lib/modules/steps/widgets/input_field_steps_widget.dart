import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class InputFieldStepsWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? sufix;
  final Widget? prefix;
  final TextAlign textAlign;
  final void Function(String e)? onFuncion;
  final VoidCallback? onTap;
  InputFieldStepsWidget(
      {@required this.hintText,
      this.controller,
      this.textAlign = TextAlign.center,
      this.sufix,
      this.prefix,
      this.onTap,
      this.onFuncion});

  @override
  _InputFieldStepsWidgetState createState() => _InputFieldStepsWidgetState();
}

class _InputFieldStepsWidgetState extends State<InputFieldStepsWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onTap: widget.onTap,
      textAlign: widget.textAlign,
      onChanged: (e) {
        if (widget.onFuncion != null) {
          widget.onFuncion!(e);
        }
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyle.instance.hintTextFieldStepOne,
      ),
    );
  }
}
