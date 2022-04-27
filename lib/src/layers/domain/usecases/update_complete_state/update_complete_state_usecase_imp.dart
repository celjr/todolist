import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';

import '../../repositories/update_complete_state_repository.dart';
import 'update_complete_state_usecase.dart';

class UpdateCompleteStateUsecaseImp implements UpdateCompleteStateUsecase {
  final UpdateCompleteStateRepository _updateCompleteStateRepository;

  UpdateCompleteStateUsecaseImp(this._updateCompleteStateRepository);

  @override
  Future<bool> call(ToDoItemEntity toDoItemEntity) async {
    return await _updateCompleteStateRepository(toDoItemEntity);
  }
}
