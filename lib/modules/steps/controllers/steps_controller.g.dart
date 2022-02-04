// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StepsController on _StepsControllerBase, Store {
  Computed<Future<List<Map<String, dynamic>>>>? _$seachFriendComputed;

  @override
  Future<List<Map<String, dynamic>>> get seachFriend =>
      (_$seachFriendComputed ??= Computed<Future<List<Map<String, dynamic>>>>(
              () => super.seachFriend,
              name: '_StepsControllerBase.seachFriend'))
          .value;

  final _$_titleAtom = Atom(name: '_StepsControllerBase._title');

  @override
  String? get _title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  set _title(String? value) {
    _$_titleAtom.reportWrite(value, super._title, () {
      super._title = value;
    });
  }

  final _$_currentStepAtom = Atom(name: '_StepsControllerBase._currentStep');

  @override
  int get _currentStep {
    _$_currentStepAtom.reportRead();
    return super._currentStep;
  }

  @override
  set _currentStep(int value) {
    _$_currentStepAtom.reportWrite(value, super._currentStep, () {
      super._currentStep = value;
    });
  }

  final _$_stepsLengthAtom = Atom(name: '_StepsControllerBase._stepsLength');

  @override
  int get _stepsLength {
    _$_stepsLengthAtom.reportRead();
    return super._stepsLength;
  }

  @override
  set _stepsLength(int value) {
    _$_stepsLengthAtom.reportWrite(value, super._stepsLength, () {
      super._stepsLength = value;
    });
  }

  final _$_seachAtom = Atom(name: '_StepsControllerBase._seach');

  @override
  String get _seach {
    _$_seachAtom.reportRead();
    return super._seach;
  }

  @override
  set _seach(String value) {
    _$_seachAtom.reportWrite(value, super._seach, () {
      super._seach = value;
    });
  }

  final _$_personalModelAtom =
      Atom(name: '_StepsControllerBase._personalModel');

  @override
  PersonalModel? get _personalModel {
    _$_personalModelAtom.reportRead();
    return super._personalModel;
  }

  @override
  set _personalModel(PersonalModel? value) {
    _$_personalModelAtom.reportWrite(value, super._personalModel, () {
      super._personalModel = value;
    });
  }

  final _$_StepsControllerBaseActionController =
      ActionController(name: '_StepsControllerBase');

  @override
  void changeSearch(String seach) {
    final _$actionInfo = _$_StepsControllerBaseActionController.startAction(
        name: '_StepsControllerBase.changeSearch');
    try {
      return super.changeSearch(seach);
    } finally {
      _$_StepsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextStep() {
    final _$actionInfo = _$_StepsControllerBaseActionController.startAction(
        name: '_StepsControllerBase.nextStep');
    try {
      return super.nextStep();
    } finally {
      _$_StepsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previusStep() {
    final _$actionInfo = _$_StepsControllerBaseActionController.startAction(
        name: '_StepsControllerBase.previusStep');
    try {
      return super.previusStep();
    } finally {
      _$_StepsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePersonal(PersonalModel personalModel) {
    final _$actionInfo = _$_StepsControllerBaseActionController.startAction(
        name: '_StepsControllerBase.changePersonal');
    try {
      return super.changePersonal(personalModel);
    } finally {
      _$_StepsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTitle(String title) {
    final _$actionInfo = _$_StepsControllerBaseActionController.startAction(
        name: '_StepsControllerBase.changeTitle');
    try {
      return super.changeTitle(title);
    } finally {
      _$_StepsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seachFriend: ${seachFriend}
    ''';
  }
}
