import 'package:sqflite/sqflite.dart';
import 'package:todolist/src/layers/data/datasources/update_complete_state_datasource.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';

import '../../../../core/database/sqlite/db.dart';

class UpdateCompleteStateSqliteDataSource
    implements UpdateCompleteStateDataSource {
  late Database db;

  @override
  Future<bool> call(ToDoItemEntity item) async {
    db = await DB.instance.database;
    try {
      db.rawUpdate('UPDATE todo_item SET is_completed = ? WHERE id =?',
          [item.isComplete ? 1 : 0, item.id]);
      return true;
    } catch (e) {
      return false;
    }
  }
}
