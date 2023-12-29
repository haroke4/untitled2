import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/main_controller.dart';
import 'package:untitled2/screens/hall_screens/pick_table_page.dart';
import 'package:untitled2/widgets/default_scaffold_drawer.dart';
import 'package:untitled2/widgets/hall_button.dart';
import 'package:untitled2/widgets/spacer_widget.dart';

class PickHallPage extends StatefulWidget {
  const PickHallPage({Key? key}) : super(key: key);

  @override
  State<PickHallPage> createState() => _PickHallPageState();
}

class _PickHallPageState extends State<PickHallPage> {
  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите зал'),
      ),
      drawer: getDefaultScaffoldDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: _mainController.hallsList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => HallButtonWidget(
            name: _mainController.hallsList[index].name,
            onPressed: () => _onHallButtonPressed(index),
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
