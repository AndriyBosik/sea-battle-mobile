import 'package:hive/hive.dart';
import 'package:sea_battle_local_storage/const/storage_box.dart';

extension JsonExtension on Box<Map<dynamic, dynamic>> {
  Map<String, dynamic>? getJsonMap(String key) {
    Map<dynamic, dynamic>? value = get(key);
    if (value == null) {
      return null;
    }
    Map<String, dynamic> json = {};
    for (var entry in value.entries) {
      json.putIfAbsent(entry.key as String, () => entry.value);
    }
    return json;
  }
}

extension SafeRunner on HiveInterface {
  Future<Box<E>> openBoxSafely<E>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<E>(boxName);
    }
    return await Hive.openBox<E>(boxName);
  }
}