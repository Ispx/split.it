import 'package:mobx/mobx.dart';
import 'package:split_it/core/shared/firebase_repository.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';
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
  ObservableList<PersonalModel> friends = ObservableList<PersonalModel>();
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

  @action
  Future seachFriend(String search) async {
    _repository = FirebaseRepository('/friends/');
    try {
      final response = await _repository?.getAll();
      if (search.isEmpty) {
        friends.addAll(response
            ?.map((e) => new PersonalModel.fromJson(e))
            .toList() as Iterable<PersonalModel>);
      } else {
        friends.addAll(response!
            .where((element) => element['first_name']
                .toString()
                .toLowerCase()
                .contains(search.toLowerCase()))
            .map((e) => new PersonalModel.fromJson(e))
            .toList());
      }
    } catch (e) {
      friends.clear();
      throw e;
    }
  }

  @action
  void nextStep() {
    if (_currentStep == _stepsLength - 1) return;
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
