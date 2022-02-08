import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/steps/controllers/steps_controller.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';
import 'package:split_it/modules/steps/widgets/input_field_steps_widget.dart';
import 'package:split_it/modules/steps/widgets/personal_widget.dart';
import 'package:split_it/modules/steps/widgets/title_subtitle_steps_widget.dart';

class StepTwoPage extends StatefulWidget {
  final StepsController stepsController = StepsController(3);
  StepTwoPage();
  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  TextEditingController textEditingController = TextEditingController(text: "");

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await widget.stepsController.seachFriend('');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Center()),
        Expanded(
          flex: 2,
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
              onFuncion: (e) async {
                await widget.stepsController.seachFriend(e);
              },
            ),
          ),
        ),
        Observer(
          builder: (context) {
            return Container(
              child: ListPersonalWidget(
                persons: widget.stepsController.friendsSelected
                    .where((element) => element.isSelected == true)
                    .toList(),
                isFilter: true,
                onSelected: (personalModel) {
                  widget.stepsController.removeFriend(personalModel);
                },
              ),
            );
          },
        ),
        Observer(
          builder: (context) => Expanded(
            flex: 3,
            child: Container(
              child: ListPersonalWidget(
                persons: widget.stepsController.friends
                    .where((element) => element.isSelected == false)
                    .toList(),
                isFilter: textEditingController.text != "",
                onSelected: (personalModel) {
                  widget.stepsController.selectFriend(personalModel);
                },
              ),
            ),
          ),
        ),
        Expanded(flex: 3, child: Center()),
      ],
    );
  }
}

class ListPersonalWidget extends StatefulWidget {
  final List<PersonalModel> persons;
  final bool isFilter;
  final Function(PersonalModel personalModel) onSelected;
  ListPersonalWidget(
      {required this.persons, this.isFilter = false, required this.onSelected});

  @override
  State<ListPersonalWidget> createState() => _ListPersonalWidgetState();
}

class _ListPersonalWidgetState extends State<ListPersonalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            this.widget.isFilter == false
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
            ...widget.persons.map(
              (e) => PersonalWidget(
                personalModel: e,
                isFilter: widget.isFilter,
                onSelected: () {
                  widget.onSelected(e);
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
