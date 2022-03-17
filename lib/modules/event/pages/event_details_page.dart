import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/event/controllers/details_event_controller.dart';
import 'package:split_it/modules/event/widgets/itens_details_widget.dart';
import 'package:split_it/modules/event/widgets/participants_details_widget.dart';

import '../models/event_model.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel eventModel;
  EventDetailsPage(this.eventModel);
  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late DetailsEventController controller;

  initState() {
    controller = DetailsEventController(widget.eventModel);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.eventModel.title ?? '',
          style: AppTextStyle.instance.titleAppbarEventDetailsPage,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () async {
              await controller.delete();
              Navigator.pop(context);
            },
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
                controller,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(
                    child: ItensDetailsWidget(
                      itens: controller.itens,
                    ),
                  ),
                  Observer(builder: (context) {
                    if (controller.enableAlertTotalAmount)
                      return Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: Text.rich(
                            TextSpan(
                              text: 'Falta ',
                              style: AppTextStyle
                                  .instance.textAlertAmountEventDetailsPage,
                              children: [
                                TextSpan(
                                  text: Formater.currencyAmount(
                                          controller.totalAmountPending) +
                                      ' reais',
                                  style: AppTextStyle.instance
                                      .textAmountAlertAmountEventDetailsPage,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    return Center();
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
