import 'package:flutter/foundation.dart';
import 'package:split_it/modules/home/components/indicator_operation_balance.dart';

class EventModel {
  final String? title;
  final String? imagePath;
  final DateTime? createdAt;
  final int? people;
  final double? totalAmount;
  EventModel({
    @required this.title,
    @required this.imagePath,
    @required this.createdAt,
    @required this.totalAmount,
    @required this.people,
  });
}
