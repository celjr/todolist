import '../../entities/to_do_item_entity.dart';

abstract class UpdateCompleteStateUsecase {
  Future<bool> call(ToDoItemEntity toDoItemEntity);
}
