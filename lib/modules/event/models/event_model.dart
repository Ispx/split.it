import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:split_it/core/models/base_model.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/modules/event/models/personal_event_model.dart';
import 'package:split_it/modules/steps/models/item_model.dart';

import '../../../main.dart';

class EventModel extends BaseModel {
  final String? organizer;
  final String? title;
  final DateTime? createdAt;
  final List<ItemModel>? items;
  final List<PersonalEventModel>? friends;
  final double? totalAmount;
  double get splitTotalAmount => totalAmount! / totalFriends;
  int get totalFriends => friends!.length;
  double totalPending;
  EventModel(
      {this.organizer,
      this.title,
      this.createdAt,
      this.totalAmount,
      this.friends,
      this.items,
      this.totalPending = 0.00})
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
      'totalPending': totalPending
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      organizer: map['organizer'],
      title: map['title'],
      createdAt: DateTime.fromMicrosecondsSinceEpoch(
          (map['createdAt'] as Timestamp).microsecondsSinceEpoch),
      items: (map['items'] as List).map((x) => ItemModel?.fromMap(x)).toList(),
      friends: (map['friends'] as List)
          .map((x) => PersonalEventModel?.fromMap(x))
          .toList(),
      totalAmount: double.tryParse(map['totalAmount'].toString()) ?? 0.00,
      totalPending: map['totalPending'],
    );
  }

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  EventModel copyWith({
    String? organizer,
    String? title,
    DateTime? createdAt,
    List<ItemModel>? items,
    List<PersonalEventModel>? friends,
    double? totalAmount,
  }) {
    return EventModel(
      organizer: organizer ?? this.organizer,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      items: items ?? this.items,
      friends: friends ?? this.friends,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }
}
