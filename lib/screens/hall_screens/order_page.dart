import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/main_controller.dart';
import 'package:untitled2/controllers/search_bar_controller.dart';
import 'package:untitled2/models/item_in_order_model.dart';
import 'package:untitled2/models/item_model.dart';
import 'package:untitled2/widgets/add_items_to_order_button.dart';
import 'package:untitled2/widgets/item_in_order_widget.dart';
import 'package:untitled2/widgets/search_text_field.dart';
import 'package:untitled2/widgets/spacer_widget.dart';

import '../../widgets/item_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _mainController = Get.find<MainController>();
  final _searchController = SearchBarController();

  @override
  void initState() {
    super.initState();
    _searchController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_mainController.getCurrentTable().name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AddItemsToOrderButton(
              onPressed: _onAddItemsToOrderButtonPressed,
            ),
            verticalSpace(10),
            Expanded(child: Obx(() => _getItemsInOrder())),
          ],
        ),
      ),
    );
  }

  Widget _getItemsInOrder() {
    var ans = <Widget>[];
    for (var item in _mainController.getCurrentTable().orderedItems) {
      ans.add(
        ItemInOrderWidget(
          name: item.itemModel.name,
          price: item.itemModel.price,
          count: item.count.value,
          onIncrementPressed: () {
            item.count.value += 1;
            item.itemModel.countLeftInStorage.value -= 1;
          },
          onDecrementPressed: () {
            item.count.value -= 1;
            item.itemModel.countLeftInStorage.value += 1;
            if (item.count.value == 0) {
              _mainController.getCurrentTable().orderedItems.remove(item);
            }
          },
        ),
      );
      ans.add(verticalSpace(12));
    }
    return ListView(children: ans);
  }

  void _onAddItemsToOrderButtonPressed() {
    showDialog(
      context: context,
      builder: (context) => _addItemDialog(context),
    );
  }

  Dialog _addItemDialog(context) {
    return Dialog(
      child: Container(
        width: 320.w,
        height: 640.h,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SearchTextField(controller: _searchController.textController),
              verticalSpace(10),
              Expanded(
                child: ListView.builder(
                  itemCount: _mainController.itemsInStockList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Obx(
                    () => ItemWidget(
                      onPressed: () => _onItemPressed(index),
                      itemModel: _mainController.itemsInStockList[index],
                      isShown:
                          _isShown(_mainController.itemsInStockList[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isShown(ItemModel itemModel) {
    if (_searchController.searchText.value == '') return true;
    return itemModel.name
        .toLowerCase()
        .contains(_searchController.searchText.value.toLowerCase());
  }

  void _onItemPressed(int itemIndex) {
    for(var item in _mainController.getCurrentTable().orderedItems){
      if (item.itemModel == _mainController.itemsInStockList[itemIndex]){
        item.count.value += 1;
        _mainController.itemsInStockList[itemIndex].countLeftInStorage.value -= 1;
        return;
      }
    }
    _mainController.getCurrentTable().orderedItems.add(
          ItemInOrderModel(
            itemModel: _mainController.itemsInStockList[itemIndex],
            count: 1.obs,
          ),
        );
    _mainController.itemsInStockList[itemIndex].countLeftInStorage.value -= 1;
  }
}
