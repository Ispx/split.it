import 'package:flutter/material.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/steps/widgets/buttom_steps_widget.dart';

class ButtomSheetStepsWidget extends StatelessWidget {
  final VoidCallback? onTapCancel;
  final VoidCallback? onTapNext;
  ButtomSheetStepsWidget(
      {@required this.onTapCancel, @required this.onTapNext});

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
                    onTap: this.onTapCancel,
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
                    onTap: this.onTapCancel,
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
