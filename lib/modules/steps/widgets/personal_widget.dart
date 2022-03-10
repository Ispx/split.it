import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';

class PersonalWidget extends StatefulWidget {
  final PersonalModel personalModel;
  final bool isFilter;
  final VoidCallback? onSelected;
  PersonalWidget(
      {required this.personalModel,
      required this.isFilter,
      required this.onSelected});
  @override
  _PersonalWidgetState createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor:
          widget.isFilter ? Colors.grey.withOpacity(0.2) : Colors.transparent,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              widget.personalModel.urlImage!,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text.rich(
        TextSpan(
            text: widget.personalModel.firstName! + ' ',
            style: widget.isFilter == true
                ? AppTextStyle.instance.titlePersonalStepFilter
                : AppTextStyle.instance.titlePersonalStepUnFilter,
            children: [
              TextSpan(
                text: widget.personalModel.secondName!,
                style: widget.isFilter == true
                    ? AppTextStyle.instance.titlePersonalStepFilter
                    : AppTextStyle.instance.titlePersonalStepUnFilter,
                children: [],
              )
            ]),
      ),
      trailing: IconButton(
        onPressed: () {
          widget.personalModel.isSelected = !widget.personalModel.isSelected;
          widget.onSelected!();
          setState(() {});
        },
        icon: Icon(
          widget.personalModel.isSelected == true ? Icons.remove : Icons.add,
          color: widget.personalModel.isSelected == true
              ? Colors.red
              : ThemeApp.config.primaryColor,
        ),
      ),
    );
  }
}
