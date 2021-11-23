import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/steps/widgets/input_field_steps_widget.dart';
import 'package:split_it/modules/steps/widgets/title_subtitle_steps_widget.dart';

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
          child: TitleSubtitleStpesWidget(
            title: 'Qual o nome',
            subtitle: 'do evento?',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: InputFieldStepsWidget(
              hintText: 'Ex: Churrasco',
            ),
          ),
        ),
        Expanded(flex: 3, child: Center()),
      ],
    );
  }
}
