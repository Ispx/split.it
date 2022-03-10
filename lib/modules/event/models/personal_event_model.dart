import 'package:split_it/modules/steps/models/personal_model.dart';

class PersonalEventModel extends PersonalModel {
  final double? totalPay;

  PersonalEventModel(PersonalModel personalModel, {required this.totalPay})
      : super(
          firstName: personalModel.firstName,
          secondName: personalModel.secondName,
          urlImage: personalModel.urlImage,
        );
}
