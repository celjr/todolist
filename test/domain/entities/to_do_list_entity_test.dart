import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

main() {
  test('entity should not be null', () {
    ToDoItemEntity toDoItem = ToDoItemEntity(title: 'studing flutter');
    ToDoListEntity toDoListEntity = ToDoListEntity(
      name: 'teste',
      itemList: [toDoItem],
    );

    expect(toDoListEntity, isNotNull);
  });

  test('list length should be 1', () {
    ToDoItemEntity toDoItem = ToDoItemEntity(title: 'studing flutter');
    ToDoListEntity toDoListEntity = ToDoListEntity(
      name: 'teste',
      itemList: [toDoItem],
    );

    expect(toDoListEntity.list.length, 1);
  });
  test('completed per cent should return 0', () {
    ToDoItemEntity toDoItem = ToDoItemEntity(title: 'studing flutter');
    ToDoListEntity toDoListEntity = ToDoListEntity(
      name: 'teste',
      itemList: [toDoItem],
    );

    expect(toDoListEntity.completedPerCent(), 0);
  });
}
