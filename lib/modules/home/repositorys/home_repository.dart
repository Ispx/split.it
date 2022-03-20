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
    try {
      double amountToPay = 0.00;
      List<Map<String, dynamic>>? allEvents =
          await FirebaseRepository.getAll('/events/');
      if (allEvents == null) {
        return BalanceModel(amountRecived: 0.00, amountToPay: .00);
      }
      double amountRecived = allEvents
              .where(
                  (element) => (element['organizer'] == getIt<UserModel>().id))
              .map((e) => e['totalPending'])
              .fold(
                0.00,
                (previousValue, element) => (previousValue ?? 0.00) + element,
              ) ??
          0.00;

      for (Map event in allEvents) {
        amountToPay += (event['friends'] as List)
            .where((element) => element['id'] == getIt<UserModel>().id)
            .map((e) => e['total_pay'])
            .fold<double>(
                0.00, (previousValue, element) => previousValue + element);
      }

      return BalanceModel(
          amountRecived: amountRecived, amountToPay: amountToPay);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<EventModel>?> getEvents() async {
    var myEvents = (await FirebaseRepository.getAll('/events/'))
        ?.where((element) => element['organizer'] == getIt<UserModel>().id)
        .toList();
    var data = myEvents?.map((e) => EventModel.fromMap(e)).toList();
    return data;
  }
}
