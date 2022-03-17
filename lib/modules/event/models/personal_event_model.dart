import 'package:split_it/modules/steps/models/personal_model.dart';

class PersonalEventModel extends PersonalModel {
  final double? totalPay;

  PersonalEventModel(PersonalModel personalModel, {required this.totalPay})
      : super(
        id:personalModel.id,
          firstName: personalModel.firstName,
          secondName: personalModel.secondName,
          urlImage: personalModel.urlImage,
          isSelected: personalModel.isSelected,
        );
}
