import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

import '../../domain/entities/to_do_item_entity.dart';
import '../../domain/repositories/save_to_do_item_repository.dart';
import '../datasources/save_to_do_item_datasource.dart';

class SaveToDoItemRepositoryImp implements SaveToDoItemRepository {
  final SaveToDoItemDataSource _saveToDoItemDataSource;

  SaveToDoItemRepositoryImp(this._saveToDoItemDataSource);

  @override
  Future<bool> call(ToDoItemEntity item, ToDoListEntity currentList) async {
    return await _saveToDoItemDataSource(item, currentList);
  }
}
