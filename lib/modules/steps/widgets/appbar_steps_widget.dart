import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/steps/controllers/steps_controller.dart';

class AppbarStepsWidget extends PreferredSize {
  AppbarStepsWidget(
      {required BuildContext context, required StepsController controller})
      : super(
          preferredSize: Size.fromHeight(80),
          child: SafeArea(
            top: true,
            left: true,
            right: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    onPressed: () {
                      if (controller.currentStep > 0) {
                        controller.previusStep();
                        return;
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                  Observer(
                    builder: (context) => Text.rich(
                      TextSpan(
                        text: NumberFormat('00')
                            .format(controller.currentStep + 1),
                        style: AppTextStyle.instance.progressStepsLeft,
                        children: [
                          TextSpan(
                            text: ' - 03',
                            style: AppTextStyle.instance.progressStepsRight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
