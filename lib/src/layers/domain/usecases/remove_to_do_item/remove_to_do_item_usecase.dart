import '../../entities/to_do_item_entity.dart';

abstract class RemoveToDoItemUsecase {
  Future<bool> call(ToDoItemEntity item);
}
