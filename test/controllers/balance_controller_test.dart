import 'package:flutter_test/flutter_test.dart';
import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/modules/event/models/event_model.dart';
import 'package:split_it/core/models/balance_model.dart';
import 'package:split_it/modules/home/controllers/balance_controller.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'package:split_it/modules/home/states/balance_states.dart';
import 'package:mobx/mobx.dart' as mobx;

class BalanceControllerMock extends BalanceController {
  BalanceControllerMock(IHomeRepository repository) : super(repository);
}

class HomeRepositoryMock implements IHomeRepository {
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
          people: 5),
      EventModel(
          title: 'Rolê no shopping',
          imagePath: ImagesApp.dollarCahOut,
          createdAt: DateTime.now(),
          totalAmount: 100.50,
          people: 5),
    ];
  }
}

void main() {
  late BalanceController _balanceController;
  late IHomeRepository _repository;
  setUp(() async {
    _repository = HomeRepositoryMock();
    _balanceController = BalanceControllerMock(_repository);
  });

  group('Teste do balanceController', () {
    test('Testes dos estados da requisição', () async {
      _balanceController = BalanceControllerMock(HomeRepositoryMock());
      mobx.autorun((p0) async {
        expect(_balanceController.state, isInstanceOf<BalanceStateEmpity>());
        _balanceController.getBalance();
        expect(_balanceController.state, isInstanceOf<BalanceStateLoading>());
        await _balanceController.getBalance();
        expect(_balanceController.state, isInstanceOf<BalanceStateDone>());
      });
    });
    test('Amount pay deve ser 201.00', () async {
      mobx.autorun((p0) async {
        final balance = await _balanceController.getBalance();
        expect(balance.amountToPay, 201.00);
      });
    });

    test('Amount recived deve ser 150.00', () async {
      mobx.autorun((p0) async {
        final balance = await _balanceController.getBalance();
        expect(balance.amountRecived, 150.00);
      });
    });
  });
}
