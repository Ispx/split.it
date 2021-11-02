import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/modules/event/models/event_model.dart';
import 'package:split_it/core/models/balance_model.dart';
import 'package:split_it/modules/home/controllers/events_controller.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'package:split_it/modules/home/states/events_states.dart';

class EventsControllerMock extends EventsController {
  EventsControllerMock(IHomeRepository repository, VoidCallback onUpdate)
      : super(repository, onUpdate: onUpdate);
}

class HomeRepositoryMock implements IHomeRepository {
  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 5));
    return [
      EventModel(
          title: 'Churrasco na laje',
          imagePath: ImagesApp.dollarCahOut,
          createdAt: DateTime.now(),
          totalAmount: 100.50,
          people: 5),
      EventModel(
          title: 'Rolê no shopping',
          imagePath: ImagesApp.dollarCahOut,
          createdAt: DateTime.now(),
          totalAmount: 100.50,
          people: 5),
    ];
  }

  @override
  Future<BalanceModel> getBalance() {
    throw UnimplementedError();
  }
}

void main() {
  late EventsController _eventsController;
  late IHomeRepository _repository;
  setUp(() async {
    _repository = HomeRepositoryMock();
    _eventsController = EventsControllerMock(_repository, () {});
  });

  group('Teste de eventsController', () {
    test('Testes dos estados da requisição', () async {
      expect(_eventsController.state, isInstanceOf<EventsStateEmpity>());
      _eventsController.getEvents();
      expect(_eventsController.state, isInstanceOf<EventsStateLoading>());
      await _eventsController.getEvents();
      expect(_eventsController.state, isInstanceOf<EventsStateDone>());
    });

    test('Deve ter dois eventos', () async {
      final events = await _eventsController.getEvents();
      expect(events.length, 2);
    });

    test(
      'Deve ter dois eventos',
      () async {
        final events = await _eventsController.getEvents();
        expect(events.length, 2);
      },
    );
    test('Valores dos atributos não deve ser nulos', () async {
      final events = await _eventsController.getEvents();
      events.forEach((e) {
        expect(e.title, isNotNull);
        expect(e.totalAmount, isNotNull);
        expect(e.people, isNotNull);
        expect(e.imagePath, isNotNull);
        expect(e.createdAt, isNotNull);
      });
    });
  });
}
