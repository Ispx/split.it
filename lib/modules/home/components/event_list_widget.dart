import 'package:flutter/material.dart';
import 'package:split_it/modules/event/models/event_model.dart';
import 'package:split_it/modules/event/widgets/event_widget.dart';

class EventListWidget extends StatelessWidget {
  List<EventModel> events;
  EventListWidget(this.events);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: events.map((e) => EventWidget(eventModel: e)).toList(),
    );
  }
}
