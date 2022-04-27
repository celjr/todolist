import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/layers/data/datasources/get_all_to_do_list_datasource.dart';
import 'package:todolist/src/layers/data/datasources/local/get_all_to_do_list_sqlite_datasourcer.dart';
import 'package:todolist/src/layers/data/repositories/get_all_to_do_list_repository_imp.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';
import 'package:todolist/src/layers/domain/repositories/get_to_do_list_by_name_repository.dart';

main() {
  GetAllToDoListDataSource dataSource = GetAllToDoListSqliteDataSourceImp();
  GetAllToDoListRepository repository = GetAllToDoListRepositoryImp(dataSource);

  test('should return a ToDoList', () {
    var result = repository();

    expect(result, isInstanceOf<ToDoListEntity>());
  });
}
