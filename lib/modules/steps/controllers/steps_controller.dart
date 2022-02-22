import 'package:mobx/mobx.dart';
import 'package:split_it/core/shared/firebase_repository.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';

import '../../event/models/event_model.dart';
import '../models/item_model.dart';
part 'steps_controller.g.dart';

class StepsController = _StepsControllerBase with _$StepsController;

abstract class _StepsControllerBase with Store {
  FirebaseRepository? _repository;
  @observable
  String? _title;
  @observable
  int _currentStep = 0;
  @observable
  int _stepsLength;
  @observable
  EventModel? _eventModel;
  ObservableList<PersonalModel> friends = ObservableList<PersonalModel>();
  ObservableList<ItemModel> items = ObservableList<ItemModel>();
  ObservableList<PersonalModel> friendsSelected =
      ObservableList<PersonalModel>();
  _StepsControllerBase(this._stepsLength);

  @observable
  PersonalModel? _personalModel;
  String get title => _title ?? "";
  int get currentStep => _currentStep;
  PersonalModel get personalModel =>
      _personalModel ??
      PersonalModel(firstName: '', secondName: '', urlImage: '');

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
    _repository = FirebaseRepository('/events/');
  }

  @action
  Future seachFriend(String search) async {
    try {
      if (search.isEmpty) {
        this.friends.clear();
        _repository = FirebaseRepository('/friends/');
        final response = await _repository?.getAll();
        final friends =
            response?.map((e) => new PersonalModel.fromMap(e)).toList();
        this.friends.addAll(friends as Iterable<PersonalModel>);
        if (friendsSelected.isNotEmpty) {
          for (PersonalModel friend in this.friendsSelected) {
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
  void nextStep() async {
    if (_currentStep == _stepsLength - 1) {
      await createEvent();
      return;
    }
    _currentStep++;
  }

  @action
  void selectFriend(PersonalModel personalModel) {
    friends.remove(personalModel);
    friendsSelected.add(personalModel);
  }

  @action
  void removeFriend(PersonalModel personalModel) {
    friends.add(personalModel);
    friendsSelected.remove(personalModel);
  }

  @action
  void previusStep() {
    if (_currentStep == 0) return;
    _currentStep--;
  }

  @action
  void changePersonal(PersonalModel personalModel) {
    this._personalModel = personalModel;
  }

  @action
  void changeTitle(String title) {
    this._title = title;
  }
}
