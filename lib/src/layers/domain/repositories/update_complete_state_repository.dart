import '../entities/to_do_item_entity.dart';

abstract class UpdateCompleteStateRepository {
  Future<bool> call(ToDoItemEntity toDoItemEntity);
}
