import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/steps/widgets/buttom_steps_widget.dart';

class ButtomSheetStepsWidget extends StatefulWidget {
  final Function? onTapCancel;
  final Function? onTapNext;
  final bool isEnableNext;

  ButtomSheetStepsWidget(
      {this.onTapCancel, this.onTapNext, this.isEnableNext = false});

  @override
  State<ButtomSheetStepsWidget> createState() => _ButtomSheetStepsWidgetState();
}

class _ButtomSheetStepsWidgetState extends State<ButtomSheetStepsWidget> {
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
                      widget.onTapCancel!();
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
                    isEnable: widget.isEnableNext,
                    onTap: () {
                      widget.onTapNext!();
                    },
                    title: 'Avançar',
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
