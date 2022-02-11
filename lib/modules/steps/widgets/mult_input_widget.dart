import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'input_field_steps_widget.dart';

class MultInputWidget extends StatefulWidget {
  final int? qtd;
  final String? name;
  final double? amount;

  const MultInputWidget({Key? key, this.qtd, this.name, this.amount})
      : super(key: key);

  @override
  _MultInputWidgetState createState() => _MultInputWidgetState();
}

class _MultInputWidgetState extends State<MultInputWidget> {
  late MoneyMaskedTextController textEditingAmount;
  late TextEditingController textEditingName;
  late TextEditingController textEditingQtd;
  @override
  void initState() {
    textEditingAmount = MoneyMaskedTextController(leftSymbol: 'R\$ ');
    textEditingAmount.updateValue(widget.amount ?? 0.00);
    textEditingName = TextEditingController();
    textEditingQtd = TextEditingController(text: '1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: InputFieldStepsWidget(
            keyboardType: TextInputType.number,
            hintText: '1',
          ),
        ),
        Flexible(
          flex: 7,
          child: InputFieldStepsWidget(
            hintText: 'Ex. Picanha',
          ),
        ),
        Flexible(
          flex: 2,
          child: InputFieldStepsWidget(
            controller: textEditingAmount,
            keyboardType: TextInputType.number,
          ),
        ),
        widget.amount == null && widget.name == null
            ? Center()
            : IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              )
      ],
    );
  }
}
