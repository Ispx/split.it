import 'package:split_it/modules/event/models/event_model.dart';

abstract class EventsState {}

class EventsStateEmpity implements EventsState {}

class EventsStateLoading implements EventsState {}

class EventsStateError implements EventsState {
  String message;
  EventsStateError(this.message);
}

class EventsStateDone implements EventsState {
  List<EventModel> events;
  EventsStateDone(this.events);
}
