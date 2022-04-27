import '../../domain/entities/to_do_item_entity.dart';

abstract class UpdateCompleteStateDataSource {
  Future<bool> call(ToDoItemEntity item);
}
