import 'package:mobx/mobx.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';
part 'steps_controller.g.dart';

class StepsController = _StepsControllerBase with _$StepsController;

abstract class _StepsControllerBase with Store {
  @observable
  String? _title;
  @observable
  int _currentStep = 0;
  @observable
  int _stepsLength;
  _StepsControllerBase(this._stepsLength);
  @observable
  PersonalModel? _personalModel;
  String get title => _title ?? "";
  int get currentStep => _currentStep;
  PersonalModel get personalModel =>
      _personalModel ??
      PersonalModel(firstName: '', secondName: '', urlImage: '');
  @action
  void nextStep() {
    if (_currentStep == _stepsLength - 1) return;
    _currentStep++;
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
