import 'package:get/get.dart';

class ItemModel {
  final String name;
  final String photoUrl;
  final int price;
  final Rx<int> countLeftInStorage;

  const ItemModel({
    required this.name,
    required this.photoUrl,
    required this.price,
    required this.countLeftInStorage,
  });
}
