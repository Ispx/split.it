class ItemModel {
  final String? name;
  final int? qtd;
  final double? amount;

  ItemModel({this.name, this.qtd = 1, this.amount});

  ItemModel copyWith({
    String? name,
    int? qtd,
    double? amount,
  }) {
    return ItemModel(
      name: name ?? this.name,
      qtd: qtd ?? this.qtd,
      amount: amount ?? this.amount,
    );
  }
}
