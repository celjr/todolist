import 'package:sqflite/sqflite.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

import '../../../../core/database/sqlite/db.dart';
import '../save_to_do_item_datasource.dart';

class SaveToDoItemSqliteDataSource implements SaveToDoItemDataSource {
  late Database db;

  @override
  Future<bool> call(ToDoItemEntity item, ToDoListEntity currentList) async {
    db = await DB.instance.database;
    try {
      db.transaction((txn) async {
        item.id = await txn.rawInsert('''INSERT INTO 
            todo_item(title,
              description,
              is_completed,
              list_id)
              VALUES("${item.title}",
              "${item.descrition}",
              ${item.isComplete ? 1 : 0},
              ${currentList.id})''');
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
