import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

import '../../domain/entities/to_do_item_entity.dart';

abstract class SaveToDoItemDataSource {
  Future<bool> call(ToDoItemEntity item, ToDoListEntity currentList);
}
