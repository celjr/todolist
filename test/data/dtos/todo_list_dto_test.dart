import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/layers/data/dtos/todo_item_dto.dart';
import 'package:todolist/src/layers/data/dtos/todo_list_dto.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

main() {
  test('', () {
    ToDoItemEntity itemDto = ToDoItemDto(title: 'test');
    ToDoItemEntity itemDto2 = ToDoItemDto(title: 'test');
    ToDoListEntity dto =
        ToDoListDto(name: 'test', itemList: [itemDto, itemDto2]);
    var result = ToDoListDto.toMap(dto);
    print(result.toString());
    expect(result['list'], isList);
  });
}
