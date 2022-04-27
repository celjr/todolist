import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/layers/data/datasources/get_all_to_do_list_datasource.dart';
import 'package:todolist/src/layers/data/datasources/local/get_all_to_do_list_sqlite_datasourcer.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

main() async {
  test('should retunr a list of ToDoListDto', () {
    GetAllToDoListDataSource dataSource = GetAllToDoListSqliteDataSourceImp();

    List<ToDoListEntity>? result;
    dataSource().then((value) {
      result = value;
    });

    expect(result, []);
  });
}
