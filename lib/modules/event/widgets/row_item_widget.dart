import 'package:flutter/material.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/event/models/item_model.dart';

class RowItemWidget extends StatelessWidget {
  final ItemModel? itemModel;
  RowItemWidget({this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.itemModel!.name!,
                style: AppTextStyle.instance.titleItem,
              ),
              Text(
                Formater.currencyAmount(itemModel!.value!),
                style: AppTextStyle.instance.titleItem,
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
