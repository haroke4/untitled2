import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/screens/cassa/cassa_main_page.dart';
import 'package:untitled2/screens/hall_screens/pick_hall_page.dart';

Drawer getDefaultScaffoldDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ListTile(
          title: Text('Залы'),
          onTap: () {
            Get.offAll(PickHallPage());
          },
        ),
        ListTile(
          title: Text('Касса'),
          onTap: () {
            Get.offAll(CassaMainPage());
          },
        ),
        // Add more categories here
      ],
    ),
  );
}
