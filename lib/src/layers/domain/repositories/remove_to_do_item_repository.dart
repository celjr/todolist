import '../entities/to_do_item_entity.dart';

abstract class RemoveToDoItemRepository {
  Future<bool> call(ToDoItemEntity item);
}
