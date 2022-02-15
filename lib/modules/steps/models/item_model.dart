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
}
