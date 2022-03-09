import 'package:flutter/material.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/event/models/personal_event_model.dart';
import 'package:split_it/modules/event/widgets/itens_details_widget.dart';
import 'package:split_it/modules/event/widgets/participants_details_widget.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';

import '../models/event_model.dart';
import '../../steps/models/item_model.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel eventModel;
  EventDetailsPage(this.eventModel);
  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late List<ItemModel> itens;
  late List<PersonalEventModel> persons;
  late double totalAmountPersons;
  late double totalAmountItems;
  initState() {
    totalAmountPersons = 0.00;
    totalAmountItems = 0.00;
    persons = widget.eventModel.friends!
        .map((e) =>
            PersonalEventModel(e, totalPay: widget.eventModel.splitTotalAmount))
        .toList();
    itens = widget.eventModel.items!;
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
