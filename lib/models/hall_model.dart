import 'package:get/get.dart';
import 'package:untitled2/models/table_model.dart';

class HallModel {
  final String name;
  final RxList<TableModel> tables;

  const HallModel({required this.name, required this.tables});
}
