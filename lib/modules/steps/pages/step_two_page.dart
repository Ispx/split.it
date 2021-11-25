import 'package:flutter/material.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';
import 'package:split_it/modules/steps/widgets/input_field_steps_widget.dart';
import 'package:split_it/modules/steps/widgets/personal_widget.dart';
import 'package:split_it/modules/steps/widgets/title_subtitle_steps_widget.dart';

class StepTwoPage extends StatefulWidget {
  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  TextEditingController textEditingController = TextEditingController(text: "");
  late List<PersonalModel> persons;

  @override
  void initState() {
    persons = [
      PersonalModel(firstName: 'Maria', secondName: 'Clara', urlImage: ''),
      PersonalModel(firstName: 'Vitor', secondName: 'Hugo', urlImage: ''),
      PersonalModel(firstName: 'Joaquina', secondName: 'Viana', urlImage: ''),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Center()),
        Expanded(
          child: TitleSubtitleStpesWidget(
            title: 'Com quem você',
            subtitle: 'quer dividir?',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: InputFieldStepsWidget(
              controller: textEditingController,
              hintText: 'Nome da pessoa',
              onFuncion: (e) {
                textEditingController.text = e;
                setState(() {});
              },
            ),
          ),
        ),
        textEditingController.text == ""
            ? Expanded(
                flex: 2,
                child: Container(
                  child: ListRecentPersonalWidget(
                    persons: persons
                        .where((element) => element.isSelected == true)
                        .toList(),
                    isFilter: true,
                    onSelected: () {
                      setState(() {});
                    },
                  ),
                ),
              )
            : Center(),
        Expanded(
          flex: 3,
          child: Container(
            child: ListRecentPersonalWidget(
              persons: persons
                  .where((element) => element.isSelected == false)
                  .toList(),
              isFilter: textEditingController.text != "",
              onSelected: () {
                setState(() {});
              },
            ),
          ),
        ),
        Expanded(flex: 3, child: Center()),
      ],
    );
  }
}

class ListRecentPersonalWidget extends StatelessWidget {
  final List<PersonalModel>? persons;
  bool? isFilter = false;
  VoidCallback? onSelected;
  ListRecentPersonalWidget(
      {@required this.persons,
      @required this.isFilter,
      @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            this.isFilter == false
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        'Recentes',
                      ),
                    ),
                  )
                : Center(),
            ...persons!.map(
              (e) => PersonalWidget(
                personalModel: e,
                isFilter: isFilter,
                onSelected: () {
                  onSelected!();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
