import 'package:split_it/core/models/balance_model.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/shared/firebase_repository.dart';
import 'package:split_it/modules/event/models/event_model.dart';

import '../../../main.dart';

abstract class IHomeRepository {
  Future<List<EventModel>?> getEvents();
  Future<BalanceModel> getBalance();
}

class HomeRepository implements IHomeRepository {
  @override
  Future<BalanceModel> getBalance() async {

    return BalanceModel(amountRecived: 150.00, amountToPay: 201.00);
  }

  @override
  Future<List<EventModel>?> getEvents() async {
    var myEvents = (await FirebaseRepository.getAll('/events/'))
        ?.where((element) => element['organizer'] == getIt<UserModel>().id)
        .toList();
    return myEvents?.map((e) => EventModel.fromMap(e)).toList();
  }
}
