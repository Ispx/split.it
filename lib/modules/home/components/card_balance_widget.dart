import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';

class CardBalanceWidget extends StatelessWidget {
  final String? amount;
  final String? title;
  final String? imagePath;
  final TextStyle? textStyle;
  CardBalanceWidget(
      {required this.amount,
      required this.title,
      required this.imagePath,
      required this.textStyle});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(this.imagePath!),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.title!,
                        style: AppTextStyle.instance.titleBalanceCard,
                      ),
                      Text(
                        this.amount!,
                        style: this.textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
