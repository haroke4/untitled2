import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddItemsToOrderButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddItemsToOrderButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Row(
        children: [
          Icon(CupertinoIcons.add_circled),
          Expanded(child: Text("Добавить товар", textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}
