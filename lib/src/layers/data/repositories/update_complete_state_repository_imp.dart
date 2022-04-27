import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/repositories/update_complete_state_repository.dart';

import '../datasources/update_complete_state_datasource.dart';

class UpdateCompleteStateRepositoryImp
    implements UpdateCompleteStateRepository {
  final UpdateCompleteStateDataSource _updateCompleteStateDataSource;

  UpdateCompleteStateRepositoryImp(this._updateCompleteStateDataSource);

  @override
  Future<bool> call(ToDoItemEntity toDoItemEntity) async {
    return await _updateCompleteStateDataSource(toDoItemEntity);
  }
}
