import 'package:split_it/modules/event/models/event_model.dart';

abstract class HomeState {}

class HomeStateEmpity implements HomeState {}

class HomeStateLoading implements HomeState {}

class HomeStateError implements HomeState {
  String message;
  HomeStateError(this.message);
}

class HomeStateDone implements HomeState {
  List<EventModel> events;
  HomeStateDone(this.events);
}
