import 'package:flutter/material.dart';
import 'package:split_it/modules/steps/widgets/title_subtitle_steps_widget.dart';

import '../widgets/mult_input_widget.dart';

class StepThreePage extends StatefulWidget {
  const StepThreePage({Key? key}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Center()),
            Expanded(
              child: TitleSubtitleStpesWidget(
                  title: 'Qual ou quais', subtitle: 'ítens você quer dividir?'),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: MultInputWidget(),
                )),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            Expanded(flex: 4, child: Center()),
          ],
        ),
      ),
    );
  }
}
