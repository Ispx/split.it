import 'package:flutter/foundation.dart';

class PersonalModel {
  final String? firstName;
  final String? secondName;
  final String? urlImage;
  bool? isSelected = false;

  PersonalModel({
    @required this.firstName,
    @required this.secondName,
    @required this.urlImage,
  });
}
