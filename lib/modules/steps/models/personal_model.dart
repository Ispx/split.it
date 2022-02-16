class PersonalModel {
  final String? firstName;
  final String? secondName;
  final String? urlImage;
  bool? isSelected = false;

  PersonalModel({
    required this.firstName,
    required this.secondName,
    required this.urlImage,
  });
  factory PersonalModel.fromMap(Map map) => PersonalModel(
        firstName: map['first_name'],
        secondName: map['second_name'],
        urlImage: map['url_image'].toString().isNotEmpty
            ? map['url_image']
            : 'https://th.bing.com/th/id/OIP.NRYWYCYaB-hfvpkmQEAu5QHaHw?pid=ImgDet&rs=1',
      );

  bool isEquals(PersonalModel personalModel) {
    return this.firstName?.toLowerCase() ==
            personalModel.firstName?.toLowerCase() &&
        this.secondName?.toLowerCase() == this.secondName?.toLowerCase() &&
        this.urlImage == personalModel.urlImage;
  }
}
