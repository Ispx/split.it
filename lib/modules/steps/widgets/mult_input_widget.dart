import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'input_field_steps_widget.dart';

class MultInputWidget extends StatefulWidget {
  final MoneyMaskedTextController textEditingAmount;
  final TextEditingController textEditingName;
  final TextEditingController textEditingQtd;
  final VoidCallback? onRemoved;
  const MultInputWidget(
      {Key? key,
      required this.textEditingAmount,
      required this.textEditingName,
      required this.textEditingQtd,
      this.onRemoved})
      : super(key: key);

  @override
  _MultInputWidgetState createState() => _MultInputWidgetState();
}

class _MultInputWidgetState extends State<MultInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: InputFieldStepsWidget(
            controller: widget.textEditingQtd,
            keyboardType: TextInputType.number,
            onFuncion: (e) {
              setState(() {});
            },
          ),
        ),
        Flexible(
          flex: 7,
          child: InputFieldStepsWidget(
            controller: widget.textEditingName,
            onFuncion: (e) {
              setState(() {});
            },
            hintText: 'Ex. Picanha',
          ),
        ),
        Flexible(
          flex: 2,
          child: InputFieldStepsWidget(
            controller: widget.textEditingAmount,
            keyboardType: TextInputType.number,
            onFuncion: (e) {
              setState(() {});
            },
          ),
        ),
        widget.textEditingName.text.isEmpty
            ? Center()
            : IconButton(
                onPressed: () {
                  if (widget.onRemoved != null) {
                    widget.onRemoved!();
                    setState(() {});
                  }
                },
                icon: Icon(Icons.delete),
              ),
      ],
    );
  }
}
