import 'package:flutter/material.dart';
import 'package:untitled2/models/table_model.dart';

class CassaTableWidget extends StatelessWidget {
  final TableModel tableModel;

  const CassaTableWidget({Key? key, required this.tableModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(tableModel.name),
              const Expanded(child: Text("15:34", textAlign: TextAlign.right)),
            ],
          ),
          Row(
            children: [
              Text(tableModel.hallName),
              Expanded(
                child: Text(
                  getTotalPrice(),
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String getTotalPrice() {
    var ans = 0;
    print(tableModel.orderedItems);
    for (var i in tableModel.orderedItems) {
      ans += i.itemModel.price * i.count.value;
    }
    return '$ans тенге';
  }
}
