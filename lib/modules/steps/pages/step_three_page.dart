import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/steps/models/item_model.dart';
import 'package:split_it/modules/steps/widgets/created_item_widget.dart';
import 'package:split_it/modules/steps/widgets/title_subtitle_steps_widget.dart';

import '../controllers/steps_controller.dart';
import '../widgets/mult_input_widget.dart';

class StepThreePage extends StatefulWidget {
  final StepsController controller;
  StepThreePage({Key? key, required this.controller}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  late ScrollController scrollController;
  ItemModel? itemModel;
  @override
  void initState() {
    scrollController = ScrollController();
    itemModel = ItemModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 72,
              ),
              TitleSubtitleStpesWidget(
                  title: 'Qual ou quais', subtitle: 'ítens você quer dividir?'),
              SizedBox(
                height: 36,
              ),
              SizedBox(
                height: 120,
                width: double.maxFinite,
                child: CreatedItemWidget((item) {
                  try {
                    widget.controller.addItem(item);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Falha ao inserir usuário'),
                      ),
                    );
                  }
                }),
              ),
              SizedBox(
                height: 36,
              ),
              Observer(
                builder: (context) {
                  if (widget.controller.items.isEmpty) return Center();
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: Scrollbar(
                      controller: scrollController,
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lista de Itens',
                                  style: AppTextStyle.instance.titleItem,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                ...widget.controller.items
                                    .map(
                                      (item) => MultInputWidget(
                                        textEditingQtd: TextEditingController(
                                          text: item.qtd.toString(),
                                        ),
                                        textEditingName: TextEditingController(
                                          text: item.name,
                                        ),
                                        textEditingAmount:
                                            MoneyMaskedTextController(
                                                leftSymbol: 'R\$ ')
                                              ..updateValue(item.amount),
                                        onRemoved: () {
                                          widget.controller.removeItem(item);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
