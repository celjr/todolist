import 'package:todolist/src/layers/data/datasources/remove_to_do_item_datasource.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/repositories/remove_to_do_item_repository.dart';

class RemoveToDoItemRepositoryImp implements RemoveToDoItemRepository {
  final RemoveToDoItemDataSource _removeToDoItemDataSource;

  RemoveToDoItemRepositoryImp(this._removeToDoItemDataSource);

  @override
  Future<bool> call(ToDoItemEntity item) async {
    return await _removeToDoItemDataSource(item);
  }
}
