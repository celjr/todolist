import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
  }
}
