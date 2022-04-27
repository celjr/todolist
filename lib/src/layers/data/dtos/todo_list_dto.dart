import 'package:todolist/src/layers/data/dtos/todo_item_dto.dart';

import '../../domain/entities/to_do_item_entity.dart';
import '../../domain/entities/to_do_list_entity.dart';

class ToDoListDto extends ToDoListEntity {
  @override
  int? id;
  String name;
  List<ToDoItemEntity>? itemList;
  ToDoListDto({this.id, required this.name, this.itemList})
      : super(name: name, itemList: itemList, id: id);

  static Map toMap(ToDoListEntity list) {
    return {
      'name': list.name,
      'list': list.list.map((e) => ToDoItemDto.toMap(e)).toList(),
    };
  }

  static ToDoListDto fromMap(Map map) {
    return ToDoListDto(name: map['name'], itemList: map['list']);
  }
}
