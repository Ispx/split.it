import 'package:flutter/material.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/event/models/personal_event_model.dart';
import 'package:split_it/modules/event/widgets/itens_details_widget.dart';
import 'package:split_it/modules/event/widgets/participants_details_widget.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';

import '../steps/models/item_model.dart';

class DetailsEventPage extends StatefulWidget {
  @override
  State<DetailsEventPage> createState() => _DetailsEventPageState();
}

class _DetailsEventPageState extends State<DetailsEventPage> {
  late List<ItemModel> itens;
  late List<PersonalEventModel> persons;
  late double totalAmountPersons;
  late double totalAmountItems;
  initState() {
    totalAmountPersons = 0.00;
    totalAmountItems = 0.00;
    persons = [
      PersonalEventModel(
        PersonalModel(
          urlImage: 'https://avatarfiles.alphacoders.com/105/thumb-105223.jpg',
          firstName: 'Você',
          secondName: '',
        ),
        totalPay: 126.00,
        isSelected: true,
      ),
      PersonalEventModel(
        PersonalModel(
          urlImage:
              'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/10.png',
          firstName: 'Maria',
          secondName: 'Antonia',
        ),
        totalPay: 126.00,
        isSelected: false,
      ),
    ];
    itens = [
      ItemModel(name: 'Picanha', amount: 122.00),
      ItemModel(name: 'Linguiça', amount: 17.00),
      ItemModel(name: 'Carvão', amount: 19.00),
      ItemModel(name: 'Cerveja', amount: 68.00),
      ItemModel(name: 'Refrigerante', amount: 12.00),
      ItemModel(name: 'Pão de alho', amount: 15.00),
    ];
    for (var person in persons) {
      totalAmountPersons += person.totalPay!;
    }
    for (var item in itens) {
      totalAmountItems += item.amount!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Churrasco',
          style: AppTextStyle.instance.titleAppbarEventDetailsPage,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
          )
        ],
      ),
      backgroundColor: Color(0XFFE5E5E5),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 3,
              child: ParticipantsDetailsWidget(
                persons,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  ItensDetailsWidget(
                    itens: itens,
                  ),
                  totalAmountItems > totalAmountPersons
                      ? Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            child: Text.rich(
                              TextSpan(
                                text: 'Faltam ',
                                style: AppTextStyle
                                    .instance.textAlertAmountEventDetailsPage,
                                children: [
                                  TextSpan(
                                    text: Formater.currencyAmount(
                                      totalAmountItems - totalAmountPersons,
                                    ),
                                    style: AppTextStyle.instance
                                        .textAmountAlertAmountEventDetailsPage,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Center()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
