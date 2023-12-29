import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/widgets/spacer_widget.dart';

class ItemInOrderWidget extends StatelessWidget {
  final String name;
  final int price;
  final int count;
  final VoidCallback onIncrementPressed;
  final VoidCallback onDecrementPressed;

  const ItemInOrderWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.onIncrementPressed,
    required this.onDecrementPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text('$price тенге'),
              ],
            ),
          ),
          GestureDetector(
            onTap: onIncrementPressed,
            child: const Icon(CupertinoIcons.add_circled, size: 26,),
          ),
          horizontalSpace(10),
          Text(count.toString()),
          horizontalSpace(10),
          GestureDetector(
            onTap: onDecrementPressed,
            child: const Icon(CupertinoIcons.minus_circle, size: 26,),
          ),
        ],
      ),
    );
  }
}
