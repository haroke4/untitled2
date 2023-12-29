import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Directory? thisAppDirectory;

Future<void> createFile(String filename, String data) async {
  thisAppDirectory ??= await getApplicationDocumentsDirectory();
  final file = File('${thisAppDirectory?.path}/$filename');
  await file.writeAsString(data);
}

Future<dynamic> readFile(filename) async {
  try {
    thisAppDirectory ??= await getApplicationDocumentsDirectory();
    final file = File('${thisAppDirectory?.path}/$filename');
    return await file.readAsString();
  } catch (e) {
    return null;
  }
}

Future<bool> _deleteFile(filename) async {
  try {
    thisAppDirectory ??= await getApplicationDocumentsDirectory();
    final file = File('${thisAppDirectory?.path}/$filename');
    await file.delete(recursive: true);
    return true;
  } catch (e) {
    return false;
  }
}

Future<Map?> getSaving() async {
  var a = await readFile('saved.json');
  if (a == null) {
    return null;
  }
  return jsonDecode(a);
}

Future<void> setSaving(List data) async {
  await createFile('saved.json', jsonEncode({'data': data}));
}

Future<void> deleteSaving() async {
  await _deleteFile('saved.json');
}
