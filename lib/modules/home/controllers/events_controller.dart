import 'package:flutter/cupertino.dart';
import 'package:split_it/modules/event/models/event_model.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'package:split_it/modules/home/states/events_states.dart';

class EventsController {
  IHomeRepository _repository;
  EventsState _state = EventsStateEmpity();
  VoidCallback? onUpdate;
  EventsController(this._repository, {@required this.onUpdate});

  void _changeState(EventsState state) {
    this._state = state;
    this.onUpdate!();
  }

  EventsState get state => _state;

  Future<List<EventModel>> getEvents() async {
    _changeState(EventsStateEmpity());
    try {
      _changeState(EventsStateLoading());
      final events = await _repository.getEvents();
      _changeState(EventsStateDone(events));
      return (_state as EventsStateDone).events;
    } catch (e) {
      _changeState(EventsStateError('Falha durante a requisição'));
      throw (_state as EventsStateError).message;
    }
  }
}
