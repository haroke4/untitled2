import 'package:flutter/material.dart';

class HallButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const HallButtonWidget({Key? key, required this.name, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(name),
        ],
      ),
    );
  }
}
