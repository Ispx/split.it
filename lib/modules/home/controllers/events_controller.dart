import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event/models/event_model.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'package:split_it/modules/home/states/events_states.dart';
part 'events_controller.g.dart';

class EventsController = _EventsControllerBase with _$EventsController;

abstract class _EventsControllerBase with Store {
  IHomeRepository? _repository;
  @observable
  EventsState _state = EventsStateEmpity();
  _EventsControllerBase(this._repository);

  void _changeState(EventsState state) {
    this._state = state;
  }

  EventsState get state => _state;
  @action
  Future<List<EventModel>> getEvents() async {
    _changeState(EventsStateEmpity());
    try {
      _changeState(EventsStateLoading());
      final events = (await _repository!.getEvents())
        ?..sort((a, b) => a.createdAt!.isBefore(b.createdAt!) ? 1 : 0);
      _changeState(EventsStateDone(events ?? []));
      return (_state as EventsStateDone).events;
    } catch (e) {
      _changeState(EventsStateError('Falha durante a requisição'));
      throw (_state as EventsStateError).message;
    }
  }
}
