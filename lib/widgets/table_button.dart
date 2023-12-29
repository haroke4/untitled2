import 'package:flutter/material.dart';

class TableButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final bool isFree;

  const TableButtonWidget(
      {Key? key,
      required this.name,
      required this.onPressed,
      required this.isFree})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isFree ? Colors.blueAccent : Colors.redAccent,
        ),
      ),
      child: Center(
        child: Text(name),
      ),
    );
  }
}
