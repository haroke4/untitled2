import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/main_controller.dart';
import 'package:untitled2/screens/hall_screens/order_page.dart';
import 'package:untitled2/widgets/table_button.dart';

class PickTablePage extends StatefulWidget {
  const PickTablePage({Key? key}) : super(key: key);

  @override
  State<PickTablePage> createState() => _PickTablePageState();
}

class _PickTablePageState extends State<PickTablePage> {
  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_mainController.getCurrentHall().name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: _mainController.getCurrentHall().tables.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) => Obx(
            () => TableButtonWidget(
              name: _mainController.getCurrentHall().tables[index].name,
              onPressed: () => _onTablePressed(index),
              isFree: _mainController
                  .getCurrentHall()
                  .tables[index]
                  .orderedItems
                  .isEmpty,
            ),
          ),
        ),
      ),
    );
  }

  void _onTablePressed(int index) {
    _mainController.currentTableIndex.value = index;
    Get.to(OrderPage());
  }
}
