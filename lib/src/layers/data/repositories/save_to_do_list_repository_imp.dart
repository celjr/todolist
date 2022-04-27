import 'package:todolist/src/layers/data/datasources/save_to_do_list_datasoucer.dart';

import '../../domain/entities/to_do_list_entity.dart';
import '../../domain/repositories/save_to_do_list_repository.dart';

class SaveToDoListRepositoryImp implements SaveToDoListRepository {
  final SaveToDoListDataSource _saveToDoListDataSource;

  SaveToDoListRepositoryImp(this._saveToDoListDataSource);

  @override
  Future<bool> call(ToDoListEntity toDoListEntity) async {
    return await _saveToDoListDataSource(toDoListEntity);
  }
}
