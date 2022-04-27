import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';

main() {
  test('entity should not be null', () {
    ToDoItemEntity toDoItem = ToDoItemEntity(title: 'studing flutter');

    expect(toDoItem, isNotNull);
  });

  test('title should be studing flutter', () {
    ToDoItemEntity toDoItem = ToDoItemEntity(title: 'studing flutter');

    expect(toDoItem.title, 'studing flutter');
  });
}
