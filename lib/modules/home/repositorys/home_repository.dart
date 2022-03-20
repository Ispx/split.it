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
    double amountToPay = 0.00;
    List<Map<String, dynamic>>? allEvents =
        await FirebaseRepository.getAll('/events/');
    double amountRecived = allEvents
            ?.where(
                (element) => (element['organizer'] == getIt<UserModel>().id))
            .map((e) => e['totalPending'])
            .fold<double>(
              0.00,
              (previousValue, element) => previousValue + element,
            ) ??
        0.00;

    List<Map<String, dynamic>>? eventsPendingToPay = allEvents
        ?.where(
          (element) => (element['friends']['id'] == getIt<UserModel>().id &&
              element['friends']['is_selected'] == false),
        )
        .toList();

    if (eventsPendingToPay != null || (eventsPendingToPay?.length ?? 0) > 0) {
      amountToPay = eventsPendingToPay!.fold(
          0,
          (previousValue, element) =>
              previousValue +
              double.tryParse(
                element['total_pay'],
              )!);
    }
    return BalanceModel(amountRecived: amountRecived, amountToPay: amountToPay);
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
