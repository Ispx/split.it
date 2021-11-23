import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';

class PersonalStepWidget extends StatefulWidget {
  final PersonalModel? personalModel;
  bool? isSelected;
  PersonalStepWidget({@required this.personalModel, @required this.isSelected});
  @override
  _PersonalStepWidgetState createState() => _PersonalStepWidgetState();
}

class _PersonalStepWidgetState extends State<PersonalStepWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          image: DecorationImage(
            image: NetworkImage(widget.personalModel!.urlImage!),
          ),
        ),
      ),
      title: Text.rich(
        TextSpan(
            text: widget.personalModel!.firstName! + ' ',
            style: AppTextStyle.instance.titlePersonalStepUnFilter,
            children: [
              TextSpan(
                text: widget.personalModel!.secondName!,
                style: widget.isSelected == true
                    ? AppTextStyle.instance.titlePersonalStepFilter
                    : AppTextStyle.instance.titlePersonalStepUnFilter,
                children: [],
              )
            ]),
      ),
      trailing: IconButton(
        onPressed: () {
          widget.isSelected = !widget.isSelected!;
          setState(() {});
        },
        icon: Icon(
          widget.isSelected == true ? Icons.add : Icons.remove,
          color: widget.isSelected == true
              ? ThemeApp.config.primaryColor
              : Colors.red,
        ),
      ),
    );
  }
}
