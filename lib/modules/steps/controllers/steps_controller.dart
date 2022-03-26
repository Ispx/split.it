import 'package:mobx/mobx.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/shared/firebase_repository.dart';
import 'package:split_it/main.dart';
import 'package:split_it/modules/event/models/personal_event_model.dart';
import 'package:split_it/modules/login/controllers/login_controller.dart';

import '../../event/models/event_model.dart';
import '../models/item_model.dart';
part 'steps_controller.g.dart';

class StepsController = _StepsControllerBase with _$StepsController;

abstract class _StepsControllerBase with Store {
  @observable
  String? _title;
  @observable
  int _currentStep = 0;
  @observable
  int _stepsLength;
  @observable
  EventModel? _eventModel;
  ObservableList<PersonalEventModel> friends =
      ObservableList<PersonalEventModel>();
  ObservableList<ItemModel> items = ObservableList<ItemModel>();
  ObservableList<PersonalEventModel> friendsSelected =
      ObservableList<PersonalEventModel>();
  _StepsControllerBase(this._stepsLength);
  EventModel? get eventModel => _eventModel;
  @observable
  PersonalEventModel? _personalModel;
  String get title => _title ?? "";
  int get currentStep => _currentStep;
  PersonalEventModel get personalModel =>
      _personalModel ??
      PersonalEventModel(UserModel(), isSelected: false, totalPay: 0.00);

  @computed
  bool get enableNextButton {
    if (currentStep == 0) {
      return _title?.isNotEmpty ?? false;
    } else if (currentStep == 1) {
      return friendsSelected.isNotEmpty;
    } else if (currentStep == 2) {
      return items.isNotEmpty;
    }
    return false;
  }

  @action
  Future createEvent() async {
    double totalPay = items.fold<double>(
        0, (previousValue, element) => previousValue + element.amount!);
    int totalFriends = this.friendsSelected.length;
    this
        .friendsSelected
        .forEach((friend) => friend.totalPay = totalPay / totalFriends);
    this._eventModel = EventModel(
      title: this._title,
      createdAt: DateTime.now(),
      totalAmount: items.fold<double>(
          0, (previousValue, element) => previousValue + element.amount!),
      items: this.items,
      friends: this.friendsSelected,
    );
    await FirebaseRepository.create<EventModel>(this._eventModel!);
  }

  @action
  Future seachFriend(String search) async {
    try {
      if (search.isEmpty) {
        this.friends.clear();
        final response = await FirebaseRepository.getAll('/users/');
        final friends = response
            ?.where((element) =>
                element['id'] != getIt.get<LoginController>().authModel!.id)
            .map((e) => new PersonalEventModel.fromMap(e))
            .toList();
        this.friends.addAll(friends as Iterable<PersonalEventModel>);
        if (friendsSelected.isNotEmpty) {
          for (PersonalEventModel friend in this.friendsSelected) {
            this.friends.removeWhere((element) => element.isEquals(friend));
          }
        }
      } else if (search.isNotEmpty) {
        var friendsFiltered = this
            .friends
            .where((element) =>
                element.firstName!.toLowerCase().contains(search.toLowerCase()))
            .toList();
        this.friends.clear();
        this.friends.addAll(friendsFiltered);
      }
    } catch (e) {
      friends.clear();
      throw e;
    }
  }

  @action
  void addItem(ItemModel? itemModel) {
    if (itemModel != null &&
        itemModel.name!.isNotEmpty &&
        itemModel.amount! > 0) {
      items.add(itemModel);
      return;
    }
    throw 'Falha ao inserir item';
  }

  @action
  void removeItem(ItemModel? itemModel) {
    items.remove(itemModel);
  }

  @action
  nextStep() async {
    if (_currentStep == _stepsLength - 1) {
      await createEvent();
      return;
    }
    _currentStep++;
  }

  @action
  void selectFriend(PersonalEventModel personalModel) {
    friends.remove(personalModel);
    friendsSelected.add(personalModel);
  }

  @action
  void removeFriend(PersonalEventModel personalModel) {
    friends.add(personalModel);
    friendsSelected.remove(personalModel);
  }

  @action
  void previusStep() {
    if (_currentStep == 0) return;
    _currentStep--;
  }

  @action
  void changePersonal(PersonalEventModel personalModel) {
    this._personalModel = personalModel;
  }

  @action
  void changeTitle(String title) {
    this._title = title;
  }
}
