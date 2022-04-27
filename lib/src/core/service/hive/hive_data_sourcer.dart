import 'package:hive/hive.dart';

import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';

import 'to_do_item_hive_adapter.dart';
import 'to_do_list_hive_adapter.dart';

class HiveDataSourcer {
  late LazyBox toDoItemBox;
  late LazyBox toDoListBox;

  HiveDataSourcer() {
    _startDataSourcer();
  }

  _startDataSourcer() async {
    await _openBox();
  }

  _openBox() async {
    Hive.registerAdapter(ToDoItemHiveAdapter());
    Hive.registerAdapter(ToDoListHiveAdapter());
    toDoItemBox = await Hive.openLazyBox<List<ToDoItemEntity>>('todo_itens');
  }
}
