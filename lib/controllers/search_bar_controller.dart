import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:string_similarity/string_similarity.dart';

class SearchBarController extends GetxController {
  final textController = TextEditingController();
  var searchText = ''.obs;

  void initialize() {
    textController.addListener(() {
      searchText.value = textController.text;
    });
  }

}
