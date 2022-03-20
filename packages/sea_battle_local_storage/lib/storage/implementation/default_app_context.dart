import 'package:hive/hive.dart';
import 'package:sea_battle_converter/converter/abstraction/converter.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_local_storage/extension/hive_extension.dart';
import 'package:sea_battle_local_storage/storage/abstraction/app_context.dart';

class DefaultAppContext implements AppContext {
  static const _appContextBoxName = "app_context";
  static const _savedAppContextKey = "context";

  final HiveInterface _hive;
  final Converter<Map<String, dynamic>, AppContextEntity> _appContextJsonConverter;

  DefaultAppContext({
    required HiveInterface hive,
    required Converter<Map<String, dynamic>, AppContextEntity> appContextJsonConverter
  }):
    _hive = hive,
    _appContextJsonConverter = appContextJsonConverter;

  @override
  Future<AppContextEntity?> getAppContext() async {
    await clear();
    Box<Map<dynamic, dynamic>> box = await _hive.openBoxSafely<Map<dynamic, dynamic>>(_appContextBoxName);
    Future.delayed(const Duration(milliseconds: 1500));
    Map<String, dynamic>? appContextJson = box.getJsonMap(_savedAppContextKey);
    if (appContextJson == null) {
      return null;
    }
    return _appContextJsonConverter.deserialize(appContextJson);
  }

  @override
  Future<void> saveAppContext(AppContextEntity appContext) async {
    Box<Map<dynamic, dynamic>> box = await _hive.openBoxSafely<Map<dynamic, dynamic>>(_appContextBoxName);
    await box.put(_savedAppContextKey, _appContextJsonConverter.serialize(appContext) ?? {});
  }

  @override
  Future<void> clear() async {
    Box<Map<dynamic, dynamic>> box = await _hive.openBoxSafely<Map<dynamic, dynamic>>(_appContextBoxName);
    await box.delete(_savedAppContextKey);
  }
}