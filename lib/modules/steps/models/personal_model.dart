import 'package:split_it/core/models/base_model.dart';

class PersonalModel extends BaseModel {
  final String? firstName;
  final String? secondName;
  final String? urlImage;
  bool? isSelected = true;
  String? get fullname => firstName! + ' ' + secondName!;
  PersonalModel({
    required this.firstName,
    required this.secondName,
    required this.urlImage,
  }) : super(collenction: '/friends/');
  factory PersonalModel.fromMap(Map map) => PersonalModel(
        firstName: map['first_name'],
        secondName: map['second_name'],
        urlImage: map['url_image'].toString().isNotEmpty
            ? map['url_image']
            : 'https://th.bing.com/th/id/OIP.NRYWYCYaB-hfvpkmQEAu5QHaHw?pid=ImgDet&rs=1',
      );
  @override
  Map<String, dynamic> toMap() {
    return {
      'first_name': this.firstName,
      'second_name': this.secondName,
      'url_image': this.urlImage,
      'is_selected': this.isSelected ?? false
    };
  }

  bool isEquals(PersonalModel personalModel) {
    return this.firstName?.toLowerCase() ==
            personalModel.firstName?.toLowerCase() &&
        this.secondName?.toLowerCase() == this.secondName?.toLowerCase() &&
        this.urlImage == personalModel.urlImage;
  }
}
