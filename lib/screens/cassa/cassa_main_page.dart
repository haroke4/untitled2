import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/main_controller.dart';
import 'package:untitled2/screens/hall_screens/pick_table_page.dart';
import 'package:untitled2/services/local_storage_service.dart';
import 'package:untitled2/widgets/cassa_table_widget.dart';
import 'package:untitled2/widgets/default_scaffold_drawer.dart';
import 'package:untitled2/widgets/hall_button.dart';
import 'package:untitled2/widgets/spacer_widget.dart';

class CassaMainPage extends StatefulWidget {
  const CassaMainPage({Key? key}) : super(key: key);

  @override
  State<CassaMainPage> createState() => _CassaMainPageState();
}

class _CassaMainPageState extends State<CassaMainPage> {
  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {

    var tablesWithOrders = _mainController.getTablesWithOrders();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Касса'),
      ),
      drawer: getDefaultScaffoldDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: tablesWithOrders.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CassaTableWidget(
            tableModel: tablesWithOrders[index],
          ),
          separatorBuilder: (BuildContext context, int index) =>
              verticalSpace(10),
        ),
      ),
    );
  }

  void _onHallButtonPressed(int index) {
    _mainController.currentHallIndex.value = index;
    Get.to(const PickTablePage());

  }
}
