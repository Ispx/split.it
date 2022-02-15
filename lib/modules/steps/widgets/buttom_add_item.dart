import 'package:flutter/material.dart';

class ButtomAddItem extends StatefulWidget {
  final VoidCallback onAdd;
  ButtomAddItem({Key? key, required this.onAdd}) : super(key: key);

  @override
  _ButtomAddItemState createState() => _ButtomAddItemState();
}

class _ButtomAddItemState extends State<ButtomAddItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.onAdd(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Colors.green,
          ),
          Text(
            'Adicionar',
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
