import 'package:hive/hive.dart';

import '../../../layers/domain/entities/to_do_item_entity.dart';

class ToDoItemHiveAdapter extends TypeAdapter<ToDoItemEntity> {
  @override
  int get typeId => 0;

  @override
  ToDoItemEntity read(BinaryReader reader) {
    return ToDoItemEntity(
        title: reader.readString(),
        descrition: reader.readString(),
        isComplete: reader.readBool());
  }

  @override
  void write(BinaryWriter writer, ToDoItemEntity obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.descrition);
    writer.writeBool(obj.isCompleted);
  }
}
