import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class StepOnePage extends StatefulWidget {
  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Center()),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'Qual o nome\n',
              style: AppTextStyle.instance.titleStepOne,
              children: [
                TextSpan(
                  text: 'do evento?',
                  style: AppTextStyle.instance.subTitleStepOne,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Ex: Churrasco',
                hintStyle: AppTextStyle.instance.hintTextFieldStepOne,
              ),
            ),
          ),
        ),
        Expanded(flex: 3, child: Center()),
      ],
    );
  }
}