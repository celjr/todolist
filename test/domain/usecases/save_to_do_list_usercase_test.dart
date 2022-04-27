import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/core/database/sqlite/db.dart';
import 'package:todolist/src/layers/data/datasources/local/save_to_do_list_sqlite_datasoucer.dart';
import 'package:todolist/src/layers/data/datasources/save_to_do_list_datasoucer.dart';
import 'package:todolist/src/layers/data/repositories/save_to_do_list_repository_imp.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';
import 'package:todolist/src/layers/domain/usecases/save_to_do_list/save_to_do_list_usacase.dart';
import 'package:todolist/src/layers/domain/usecases/save_to_do_list/save_to_do_list_usecase_imp.dart';

main() {
  test('should save the todolist with success', () async {
    SaveToDoListDataSource dataSource = SaveToDoListSqliteDataSource();
    SaveToDoListUseCase useCase = SaveToDoListUseCaseImp(
      SaveToDoListRepositoryImp(dataSource),
    );
    ToDoItemEntity toDoItem = ToDoItemEntity(title: 'studing flutter');
    ToDoListEntity toDoListEntity = ToDoListEntity(
      name: 'teste',
      itemList: [toDoItem],
    );

    var result = await useCase(toDoListEntity);
    expect(result, true);
  });

  test('should not save the todolist if is empty', () async {
    SaveToDoListDataSource dataSource = SaveToDoListSqliteDataSource();
    SaveToDoListUseCase useCase = SaveToDoListUseCaseImp(
      SaveToDoListRepositoryImp(dataSource),
    );
    ToDoItemEntity toDoItem = ToDoItemEntity(title: 'studing flutter');
    ToDoListEntity toDoListEntity = ToDoListEntity(name: 'teste');

    var result = await useCase(toDoListEntity);
    expect(result, false);
  });
}
