import 'dart:convert';

import 'package:split_it/core/models/base_model.dart';
import 'package:split_it/modules/steps/models/item_model.dart';
import 'package:split_it/modules/steps/models/personal_model.dart';

class EventModel extends BaseModel {
  final String? title;
  final String? imagePath;
  final DateTime? createdAt;
  final List<ItemModel>? items;
  final List<PersonalModel>? friends;
  final double? totalAmount;

  int get people => friends?.length ?? 0;
  EventModel(
      {this.title,
      this.imagePath,
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
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'],
      imagePath: map['imagePath'],
      createdAt: map['createdAt'],
      items: map['items']?.map((x) => ItemModel?.fromMap(x)),
      friends: map['friends']?.map((x) => PersonalModel?.fromMap(x)),
      totalAmount: map['totalAmount'],
    );
  }

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));
}
