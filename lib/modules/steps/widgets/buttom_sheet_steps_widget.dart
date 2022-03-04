import 'package:flutter/material.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/steps/widgets/buttom_steps_widget.dart';

class ButtomSheetStepsWidget extends StatelessWidget {
  final Function? onTapCancel;
  final Function? onTapNext;
  final bool isEnableNext;
  final bool isLastStep;

  ButtomSheetStepsWidget(
      {this.onTapCancel,
      this.onTapNext,
      this.isEnableNext = false,
      this.isLastStep = false});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: .75,
            color: ThemeApp.config.gray.withOpacity(.2),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ButtomStepsWidget(
                    onTap: () {
                      onTapCancel!();
                    },
                    title: 'Cancelar',
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  width: .75,
                  color: ThemeApp.config.gray.withOpacity(.2),
                ),
                Expanded(
                  child: ButtomStepsWidget(
                    isEnable: isEnableNext,
                    enablegreenColor: isLastStep,
                    onTap: () {
                      onTapNext!();
                    },
                    title: !isLastStep ? 'Avançar' : 'Finalizar',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
