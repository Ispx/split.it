import 'package:flutter/material.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/event/models/item_model.dart';
import 'package:split_it/modules/event/widgets/row_item_widget.dart';

class ItensDetailsWidget extends StatefulWidget {
  final List<ItemModel>? itens;

  ItensDetailsWidget({this.itens});

  @override
  State<ItensDetailsWidget> createState() => _ItensDetailsWidgetState();
}

class _ItensDetailsWidgetState extends State<ItensDetailsWidget> {
  late ScrollController scrollController;
  late double totalAmount;
  @override
  void initState() {
    totalAmount = widget.itens!.fold(
      0,
      (previousValue, element) => previousValue + element.value!,
    );
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Text('ÍTENS'),
          ),
          Divider(),
          Scrollbar(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: widget.itens!
                      .map(
                        (item) => RowItemWidget(
                          itemModel: item,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            color: Color(0XFFE5E5E5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total',
                  style: AppTextStyle.instance.titleEventDetailsPage,
                ),
                Text(
                  Formater.currencyAmount(totalAmount),
                  style: AppTextStyle.instance.titleEventDetailsPage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
