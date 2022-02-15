import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:split_it/modules/steps/controllers/steps_controller.dart';
import 'package:split_it/modules/steps/widgets/mult_input_widget.dart';

import '../models/item_model.dart';
import 'buttom_add_item.dart';

class CreatedItemWidget extends StatefulWidget {
  final Function(ItemModel? onItem)? onItem;
  final StepsController? controller;
  CreatedItemWidget({this.onItem, this.controller});
  @override
  _CreatedItemWidgetState createState() => _CreatedItemWidgetState();
}

class _CreatedItemWidgetState extends State<CreatedItemWidget> {
  late MoneyMaskedTextController textEditingAmount;
  late TextEditingController textEditingName;

  @override
  void initState() {
    textEditingAmount = MoneyMaskedTextController(leftSymbol: 'R\$ ');

    textEditingAmount.updateValue(0);
    textEditingName = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: MultInputWidget(
              textEditingIndex: TextEditingController(
                  text: '${widget.controller!.items.length + 1}'),
              textEditingName: this.textEditingName,
              textEditingAmount: this.textEditingAmount,
              onRemoved: () {
                textEditingName.clear();
                textEditingAmount.updateValue(0.00);
              },
            ),
          ),
        ),
        Spacer(
          flex: 3,
        ),
        ButtomAddItem(
          onAdd: () {
            if (widget.onItem != null &&
                textEditingName.text.isNotEmpty &&
                textEditingName.text.isNotEmpty &&
                textEditingAmount.numberValue > 0.00) {
              widget.onItem!(
                ItemModel(
                  name: textEditingName.text,
                  amount: textEditingAmount.numberValue ?? 0.00,
                ),
              );
              textEditingName.clear();
              textEditingAmount.updateValue(0.00);
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
