import 'package:split_it/modules/steps/models/personal_model.dart';

class StepsController {
  String? _title;
  int _currentStep = 0;
  int _stepsLength;
  StepsController(this._stepsLength);
  PersonalModel? _personalModel;
  String get title => _title ?? "";
  int get currentStep => _currentStep;
  void nextStep() {
    if (_currentStep == _stepsLength - 1) return;
    _currentStep++;
  }

  void previusStep() {
    if (_currentStep == 0) return;
    _currentStep--;
  }

  PersonalModel get personalModel =>
      _personalModel ??
      PersonalModel(firstName: '', secondName: '', urlImage: '');
  void changePersonal(PersonalModel personalModel) {
    this._personalModel = personalModel;
  }

  void changeTitle(String title) {
    this._title = title;
  }
}
