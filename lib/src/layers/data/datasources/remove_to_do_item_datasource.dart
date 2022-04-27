import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';

abstract class RemoveToDoItemDataSource {
  Future<bool> call(ToDoItemEntity item);
}
