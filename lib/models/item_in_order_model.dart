import 'package:get/get.dart';
import 'package:untitled2/models/item_model.dart';

class ItemInOrderModel {
  final ItemModel itemModel;
  final Rx<int> count;

  const ItemInOrderModel({required this.itemModel, required this.count});

  Map<String, dynamic> toJson() {
    return {
      'name': itemModel.name,
      'count': count.value,
    };
  }
}
