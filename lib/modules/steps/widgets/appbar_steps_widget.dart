import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class AppbarStepsWidget extends PreferredSize {
  AppbarStepsWidget({@required int? currentStep})
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
                  BackButton(),
                  Text.rich(
                    TextSpan(
                      text: NumberFormat('00').format(currentStep),
                      style: AppTextStyle.instance.progressStepsLeft,
                      children: [
                        TextSpan(
                          text: ' - 03',
                          style: AppTextStyle.instance.progressStepsRight,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
}
