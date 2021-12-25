import 'package:flutter/material.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/event/models/personal_event_model.dart';
import 'package:split_it/modules/event/widgets/personal_details_widget.dart';

class ParticipantsDetailsWidget extends StatefulWidget {
  List<PersonalEventModel> personalEventModel;
  ParticipantsDetailsWidget(this.personalEventModel);
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
          Expanded(
            flex: 2,
            child: Scrollbar(
              controller: scrollController,
              isAlwaysShown: true,
              hoverThickness: 8,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ...widget.personalEventModel
                        .map(
                          (personal) => PersonalDetailsWidget(
                            personalEventModel: personal,
                          ),
                        )
                        .toList()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
