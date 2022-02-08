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
  factory PersonalModel.fromJson(Map map) => PersonalModel(
        firstName: map['first_name'],
        secondName: map['second_name'],
        urlImage: map['url_image'],
      );
}
