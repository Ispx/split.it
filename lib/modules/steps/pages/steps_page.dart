import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/steps/controllers/steps_controller.dart';
import 'package:split_it/modules/steps/pages/step_one_page.dart';
import 'package:split_it/modules/steps/pages/step_three_page.dart';
import 'package:split_it/modules/steps/pages/step_two_page.dart';
import 'package:split_it/modules/steps/widgets/appbar_steps_widget.dart';
import 'package:split_it/modules/steps/widgets/buttom_sheet_steps_widget.dart';

class StepsPage extends StatefulWidget {
  createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  late StepsController controller;
  late List<Widget> stepsPage;
  initState() {
    controller = StepsController(3);
    stepsPage = [
      StepOnePage((title) {
        controller.changeTitle(title);
      }),
      StepTwoPage(
        controller: controller,
      ),
      StepThreePage(
        controller: controller,
      )
    ];
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
      appBar: AppbarStepsWidget(context: context, controller: controller),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Observer(
          builder: (context) => stepsPage[controller.currentStep],
        ),
      ),
      bottomSheet: Observer(
        builder: (context) => ButtomSheetStepsWidget(
          onTapCancel: () {
            Navigator.of(context).pop();
          },
          isEnableNext: controller.enableNextButton,
          onTapNext: () {
            controller.nextStep();
            if (controller.currentStep == 2 && controller.eventModel != null) {
              Navigator.of(context).pushNamed(
                '/created-event-splash/',
                arguments: controller.eventModel,
              );
            }
          },
        ),
      ),
    );
  }
}
