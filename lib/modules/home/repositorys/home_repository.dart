import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/core/models/balance_model.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/shared/firebase_repository.dart';
import 'package:split_it/modules/event/models/event_model.dart';

import '../../../main.dart';

abstract class IHomeRepository {
  Future<List<EventModel>> getEvents();
  Future<BalanceModel> getBalance();
}

class HomeRepository implements IHomeRepository {
  @override
  Future<BalanceModel> getBalance() async {
    await Future.delayed(Duration(seconds: 5));
    return BalanceModel(amountRecived: 150.00, amountToPay: 201.00);
  }

  @override
  Future<List<EventModel>> getEvents() async {
    List<EventModel> events = [];
    var allEvents = await FirebaseRepository.getAll('/events/');
    List<Map<String, dynamic>> myEvents = allEvents!
        .where((element) => element['organizer'] == getIt<UserModel>().id)
        .toList();
    for (var event in myEvents) {
      events.add(EventModel.fromMap(event));
    }
    return events; //myEvents.map((e) => new  EventModel.fromMap(e)).toList();
  }
}
