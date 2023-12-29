import 'dart:async';

import 'package:get/get.dart';
import 'package:untitled2/models/hall_model.dart';
import 'package:untitled2/models/item_in_order_model.dart';
import 'package:untitled2/models/item_model.dart';
import 'package:untitled2/models/table_model.dart';
import 'package:untitled2/services/local_storage_service.dart';

import 'database.dart' as db;

class MainController extends GetxController {
  var itemsInStockList = <ItemModel>[].obs;
  var hallsList = <HallModel>[].obs;
  var currentHallIndex = 0.obs;
  var currentTableIndex = 0.obs;

  void initialize() async {

    List allHalls = db.database['halls'] as List;
    for (var hall in allHalls) {
      RxList<TableModel> tables = <TableModel>[].obs;
      for (var table in hall['tables']) {
        tables.add(
          TableModel(
            name: table['name'],
            hallName: hall['name'],
            orderedItems: <ItemInOrderModel>[].obs,
          ),
        );
      }
      hallsList.add(HallModel(name: hall['name'], tables: tables));
    }

    for (var item in db.database['items'] as List) {
      itemsInStockList.add(
        ItemModel(
          name: item['name'],
          countLeftInStorage: Rx<int>(item['countLeftInStorage']),
          photoUrl: item['photoUrl'],
          price: item['price'],
        ),
      );
    }

    var localSaving = await getSaving();
    if (localSaving != null) {
      for (var item in localSaving['data']) {
        var hall = getHallByName(item['hallName']);
        var table = getTableByName(item['name'], hall!);
        for (var orderedItem in item['orderedItems']) {
          var item = getItemByName(orderedItem['name']);
          item!.countLeftInStorage.value -= orderedItem['count'] as int;
          table?.orderedItems.add(
            ItemInOrderModel(
              itemModel: item,
              count: Rx<int>(orderedItem['count']),
            ),
          );
        }
      }
    }
    Timer.periodic(Duration(seconds: 1), (t) => saveDataToLocalStorage());
  }

  ItemModel? getItemByName(String name) {
    for (var item in itemsInStockList) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }

  TableModel? getTableByName(String name, HallModel hall) {
    for (var table in hall.tables) {
      if (table.name == name) {
        return table;
      }
    }
    return null;
  }

  HallModel? getHallByName(name) {
    for (var hall in hallsList) {
      if (hall.name == name) {
        return hall;
      }
    }
    return null;
  }

  HallModel getCurrentHall() {
    return hallsList[currentHallIndex.value];
  }

  TableModel getCurrentTable() {
    return hallsList[currentHallIndex.value].tables[currentTableIndex.value];
  }

  List<TableModel> getTablesWithOrders() {
    var ans = <TableModel>[];
    for (var hall in hallsList) {
      for (var table in hall.tables) {
        if (table.orderedItems.isNotEmpty) {
          ans.add(table);
        }
      }
    }
    return ans;
  }

  void saveDataToLocalStorage() {
    var data = [];
    for (TableModel table in getTablesWithOrders()) {
      data.add(table.toJson());
    }
    setSaving(getTablesWithOrders());
  }
}
