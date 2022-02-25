import 'dart:convert';

import 'package:split_it/core/models/base_model.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/modules/steps/models/item_model.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';

import '../../../main.dart';

class EventModel extends BaseModel {
  final String? title;
  final String? imagePath;
  final DateTime? createdAt;
  final List<ItemModel>? items;
  final List<PersonalModel>? friends;
  final double? totalAmount;
  double get splitTotalAmount => totalAmount! / (friends?.length ?? 1);
  int get people => friends?.length ?? 0;
  EventModel(
      {this.title,
      this.imagePath = 'assets/images/dollar_cash_out.png',
      this.createdAt,
      this.totalAmount,
      this.friends,
      this.items})
      : super(collenction: '/events/');
  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'createdAt': createdAt,
      'items': items?.map((e) => e.toMap()).toList(),
      'friends': friends?.map((e) => e.toMap()).toList(),
      'totalAmount': totalAmount,
      'organizer': getIt<UserModel>().id,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'],
      createdAt:
          DateTime.tryParse(map['createdAt'].toString()) ?? DateTime.now(),
      items: (map['items'] as List).map((x) => ItemModel?.fromMap(x)).toList(),
      friends: (map['friends'] as List)
          .map((x) => PersonalModel?.fromMap(x))
          .toList(),
      totalAmount: map['totalAmount'],
    );
  }

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));
}
