import 'package:flutter/material.dart';
import 'package:split_it/modules/steps/widgets/input_field_steps_widget.dart';
import 'package:split_it/modules/steps/widgets/title_subtitle_steps_widget.dart';

class StepTwoPage extends StatefulWidget {
  const StepTwoPage({Key? key}) : super(key: key);
  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Center()),
        Expanded(
          child: TitleSubtitleStpesWidget(
            title: 'Com quem você',
            subtitle: 'quer dividir?',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: InputFieldStepsWidget(
              hintText: 'Nome da pessoa',
            ),
          ),
        ),
        Expanded(flex: 3, child: Center()),
      ],
    );
  }
}
