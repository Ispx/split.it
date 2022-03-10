import 'package:mobx/mobx.dart';

import '../../steps/models/item_model.dart';
import '../models/event_model.dart';
import '../models/personal_event_model.dart';
part 'details_event_controller.g.dart';

class DetailsEventController = _DetailsEventControllerBase
    with _$DetailsEventController;

abstract class _DetailsEventControllerBase with Store {
  late List<ItemModel> itens;
  @observable
  List<PersonalEventModel> persons = [];
  late double totalAmountItems;
  @observable
  EventModel eventModel;
  double get totalAmountPending =>
      totalAmountItems -
      persons
          .where((element) => element.isSelected == true)
          .map((e) => e.totalPay!)
          .fold(0, (previousValue, element) => previousValue + element);
  @computed
  bool get enableAlertTotalAmount =>
      persons.map((e) => e.isSelected).contains(false);

  _DetailsEventControllerBase(this.eventModel) {
    totalAmountItems = 0.00;
    persons.addAll(eventModel.friends!
        .map(
            (e) => PersonalEventModel(e, totalPay: eventModel.splitTotalAmount))
        .toList());
    itens = eventModel.items!;
    for (var item in itens) {
      totalAmountItems += item.amount!;
    }
  }

  @action
  void changeIsSelected(PersonalEventModel personalModel) {
    persons
            .where((element) => element.isEquals(personalModel))
            .first
            .isSelected =
        !persons
            .where((element) => element.isEquals(personalModel))
            .first
            .isSelected;
    var list = [];
    list.addAll(persons);
    persons = List.from(list);
  }
}
