import 'package:sqflite/sqflite.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';

import '../../../../core/database/sqlite/db.dart';
import '../remove_to_do_item_datasource.dart';

class RemoveToDoItemSqliteDataSource implements RemoveToDoItemDataSource {
  late Database db;

  @override
  Future<bool> call(ToDoItemEntity item) async {
    db = await DB.instance.database;
    try {
      db.rawDelete('DELETE FROM todo_item WHERE id=?', [item.id]);

      return true;
    } catch (e) {
      return false;
    }
    ;
  }
}
