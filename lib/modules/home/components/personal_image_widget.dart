import 'package:flutter/material.dart';

class PersonalImageWidget extends StatelessWidget {
  final String? urlImage;
  PersonalImageWidget({required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Image.network(
        this.urlImage!,
        height: 60,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
