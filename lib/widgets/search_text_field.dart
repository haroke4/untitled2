import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  const SearchTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        cursorWidth: 1,
        cursorColor: const Color(0x66202020),
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          isCollapsed: true,

          hintText: "Поиск",
          hintStyle: TextStyle(fontSize: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
