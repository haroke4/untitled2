import 'dart:collection';

import 'package:get/get.dart';
import 'package:untitled2/models/item_in_order_model.dart';
import 'package:untitled2/models/item_model.dart';

class TableModel {
  final String name;
  final String hallName;
  final RxList<ItemInOrderModel> orderedItems;

  const TableModel({
    required this.name,
    required this.hallName,
    required this.orderedItems,
  });


  Map<String, dynamic> toJson(){
    var orderedItems = [];
    for (var b in this.orderedItems){
      orderedItems.add(b.toJson());
    }
    return {
      'name': name,
      'hallName': hallName,
      'orderedItems': orderedItems,
    };
  }
}
