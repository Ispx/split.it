import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/steps/pages/step_one_page.dart';
import 'package:split_it/modules/steps/pages/step_two_page.dart';
import 'package:split_it/modules/steps/widgets/appbar_steps_widget.dart';
import 'package:split_it/modules/steps/widgets/buttom_sheet_steps_widget.dart';

class StepsPage extends StatefulWidget {
  createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  late int currentStep;
  List<Widget> stepsPage = [
    StepOnePage(),
    StepTwoPage(),
  ];
  initState() {
    currentStep = 0;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ThemeApp.config.statusbarSteps,
      ),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ThemeApp.config.statusbarSteps,
      ),
    );
    return Scaffold(
      backgroundColor: ThemeApp.config.backgroundSteps,
      appBar: AppbarStepsWidget(currentStep: currentStep),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: stepsPage[currentStep],
      ),
      bottomSheet: ButtomSheetStepsWidget(
        onTapCancel: () {},
        isEnableNext: !(currentStep == stepsPage.length - 1),
        onTapNext: () {
          currentStep++;
          setState(() {});
        },
      ),
    );
  }
}
