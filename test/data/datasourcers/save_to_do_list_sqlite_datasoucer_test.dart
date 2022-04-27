import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/core/database/sqlite/db.dart';
import 'package:todolist/src/layers/data/datasources/local/save_to_do_list_sqlite_datasoucer.dart';
import 'package:todolist/src/layers/data/datasources/save_to_do_list_datasoucer.dart';
import 'package:todolist/src/layers/data/dtos/todo_item_dto.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

main() {
  test('should return true if the save is sucess', () {
    SaveToDoListDataSource dataSource = SaveToDoListSqliteDataSource();

    bool? result;
    dataSource(ToDoListEntity(name: 'test')).then((value) => result = value);
    print(result.toString());
  });
}
