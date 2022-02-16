import 'dart:convert';

class ItemModel {
  final String? name;
  final double? amount;

  ItemModel({this.name, this.amount});

  ItemModel copyWith({
    String? name,
    int? qtd,
    double? amount,
  }) {
    return ItemModel(
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      name: map['name'],
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
}
