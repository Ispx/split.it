import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/core/models/balance_model.dart';
import 'package:split_it/modules/event/models/event_model.dart';

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
    await Future.delayed(Duration(seconds: 5));
    return [
      EventModel(
        title: 'Churrasco na laje',
        imagePath: ImagesApp.dollarCahOut,
        createdAt: DateTime.now(),
        totalAmount: 100.50,
      ),
      EventModel(
        title: 'Rolê no shopping',
        imagePath: ImagesApp.dollarCahOut,
        createdAt: DateTime.now(),
        totalAmount: 100.50,
      ),
    ];
  }
}
