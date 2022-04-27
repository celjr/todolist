import 'package:hive/hive.dart';
import 'package:todolist/src/layers/data/dtos/todo_item_dto.dart';

import 'to_do_list_for_hive.dart';

class ToDoListHiveAdapter extends TypeAdapter<ToDoListForHive> {
  @override
  int get typeId => 0;

  @override
  ToDoListForHive read(BinaryReader reader) {
    return ToDoListForHive(name: reader.readString(), listId: reader.readInt());
  }

  @override
  void write(BinaryWriter writer, ToDoListForHive obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.listId);
  }
}
