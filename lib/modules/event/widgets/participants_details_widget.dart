import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/event/controllers/details_event_controller.dart';
import 'package:split_it/modules/event/widgets/personal_details_widget.dart';

class ParticipantsDetailsWidget extends StatefulWidget {
  final DetailsEventController controller;
  ParticipantsDetailsWidget(this.controller);
  @override
  State<ParticipantsDetailsWidget> createState() =>
      _ParticipantsDetailsWidgetState();
}

class _ParticipantsDetailsWidgetState extends State<ParticipantsDetailsWidget> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            'INTEGRANTES',
            style: AppTextStyle.instance.titleEventDetailsPage,
          ),
          SizedBox(
            height: 16,
          ),
          Observer(builder: (context) {
            return Expanded(
              flex: 2,
              child: Scrollbar(
                controller: scrollController,
                isAlwaysShown: true,
                hoverThickness: 8,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      ...widget.controller.persons
                          .map(
                            (personal) => Observer(
                              builder: (context) {
                                return PersonalDetailsWidget(
                                  personalEventModel: personal,
                                  onTap: () {
                                    widget.controller
                                        .changeIsSelected(personal);
                                  },
                                );
                              },
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
