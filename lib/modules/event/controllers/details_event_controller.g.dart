// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_event_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsEventController on _DetailsEventControllerBase, Store {
  Computed<bool>? _$enableAlertTotalAmountComputed;

  @override
  bool get enableAlertTotalAmount => (_$enableAlertTotalAmountComputed ??=
          Computed<bool>(() => super.enableAlertTotalAmount,
              name: '_DetailsEventControllerBase.enableAlertTotalAmount'))
      .value;

  final _$personsAtom = Atom(name: '_DetailsEventControllerBase.persons');

  @override
  List<PersonalEventModel> get persons {
    _$personsAtom.reportRead();
    return super.persons;
  }

  @override
  set persons(List<PersonalEventModel> value) {
    _$personsAtom.reportWrite(value, super.persons, () {
      super.persons = value;
    });
  }

  final _$eventModelAtom = Atom(name: '_DetailsEventControllerBase.eventModel');

  @override
  EventModel get eventModel {
    _$eventModelAtom.reportRead();
    return super.eventModel;
  }

  @override
  set eventModel(EventModel value) {
    _$eventModelAtom.reportWrite(value, super.eventModel, () {
      super.eventModel = value;
    });
  }

  final _$changeIsSelectedAsyncAction =
      AsyncAction('_DetailsEventControllerBase.changeIsSelected');

  @override
  Future<void> changeIsSelected(PersonalEventModel personalModel) {
    return _$changeIsSelectedAsyncAction
        .run(() => super.changeIsSelected(personalModel));
  }

  @override
  String toString() {
    return '''
persons: ${persons},
eventModel: ${eventModel},
enableAlertTotalAmount: ${enableAlertTotalAmount}
    ''';
  }
}
