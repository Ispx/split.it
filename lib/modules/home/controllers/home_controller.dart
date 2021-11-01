import 'package:flutter/cupertino.dart';
import 'package:split_it/modules/event/models/event_model.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'package:split_it/modules/home/states/home_states.dart';

class HomeController {
  IHomeRepository _repository;
  HomeState? _state;
  VoidCallback? onUpdate;
  HomeController(this._repository, {this.onUpdate});

  void changeState(HomeState state) {
    this._state = state;
    this.onUpdate!();
  }

  HomeState get state => _state!;

  Future<List<EventModel>> getEvents() async {
    changeState(HomeStateEmpity());
    try {
      changeState(HomeStateLoading());
      final events = await _repository.getEvents();
      changeState(HomeStateDone(events));
      return (_state as HomeStateDone).events;
    } catch (e) {
      changeState(HomeStateError('Falha durante a requisição'));
      throw (_state as HomeStateError).message;
    }
  }
}
