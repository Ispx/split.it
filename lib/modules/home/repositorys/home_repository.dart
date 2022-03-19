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
    List<Map<String, dynamic>>? events =
        (await FirebaseRepository.getAll('/events/'))
            ?.where((element) =>
                (element['friends'] as List).contains(getIt<UserModel>().id))
            .toList();

    if (events != null || (events?.length ?? 0) > 0) {
      amountToPay = events!.fold(
          0,
          (previousValue, element) =>
              previousValue +
              double.tryParse(
                element['total_pay'],
              )!);
    }
    return BalanceModel(amountRecived: 0.00, amountToPay: amountToPay);
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
