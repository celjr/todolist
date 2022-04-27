import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

abstract class SaveToDoItemRepository {
  Future<bool> call(ToDoItemEntity item, ToDoListEntity currentList);
}
