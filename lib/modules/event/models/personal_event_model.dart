import 'package:split_it/core/models/user_model.dart';

class PersonalEventModel extends UserModel {
  double? totalPay;
  bool isSelected;
  PersonalEventModel(UserModel userModel,
      {required this.totalPay, required this.isSelected})
      : super(
          id: userModel.id,
          displayName: userModel.displayName,
          email: userModel.email,
          photoUrl: userModel.photoUrl,
        );

  factory PersonalEventModel.fromMap(Map map) {
    var user = UserModel.froMap(map);
    return PersonalEventModel(
      user,
      totalPay: double.tryParse(map['total_pay'].toString()) ?? 0.00,
      isSelected: map['is_selected'] ?? false,
    );
  }
  changeIsSelected() {
    isSelected = !isSelected;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': super.id,
      'display_name': super.displayName,
      'photo_url': super.photoUrl,
      'is_selected': this.isSelected,
      'total_pay': this.totalPay
    };
  }
}
