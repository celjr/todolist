import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/core/database/sqlite/db.dart';
import 'package:todolist/src/layers/data/datasources/get_all_to_do_list_datasource.dart';
import 'package:todolist/src/layers/data/datasources/local/get_all_to_do_list_sqlite_datasourcer.dart';
import 'package:todolist/src/layers/data/repositories/get_all_to_do_list_repository_imp.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';
import 'package:todolist/src/layers/domain/repositories/get_to_do_list_by_name_repository.dart';
import 'package:todolist/src/layers/domain/usecases/get_to_do_list_by_name/get_to_do_list_by_name_usecase.dart';
import 'package:todolist/src/layers/domain/usecases/get_to_do_list_by_name/get_to_do_list_by_name_usecase_imp.dart';

main() {
  test('should return a todolist', () async {
    GetAllToDoListDataSource dataSource = GetAllToDoListSqliteDataSourceImp();
    GetAllToDoListRepository repository =
        GetAllToDoListRepositoryImp(dataSource);
    GetAllToDoListUsecase useCase = GetAllToDoListUsecaseImp(repository);

    var result = await useCase();

    expect(result, isInstanceOf<List<ToDoListEntity>>());
  });

  test('should return a todolist with name test', () async {
    GetAllToDoListDataSource dataSource = GetAllToDoListSqliteDataSourceImp();
    GetAllToDoListRepository repository =
        GetAllToDoListRepositoryImp(dataSource);
    GetAllToDoListUsecase useCase = GetAllToDoListUsecaseImp(repository);

    var result = await useCase();

    expect(result[0].name, 'test01');
  });
}
