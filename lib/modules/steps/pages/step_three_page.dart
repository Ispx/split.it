import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/modules/steps/widgets/input_field_steps_widget.dart';
import 'package:split_it/modules/steps/widgets/title_subtitle_steps_widget.dart';

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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Expanded(
                  child: Row(
                    children: [
                      Text('1'),
                      Expanded(
                          flex: 4,
                          child:
                              InputFieldStepsWidget(hintText: 'Ex. Picanha')),
                      Expanded(
                        flex: 2,
                        child: InputFieldStepsWidget(
                          hintText: Formater.currencyAmount(0),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
