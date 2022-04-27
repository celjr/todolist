import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';
import 'package:todolist/src/layers/domain/repositories/save_to_do_item_repository.dart';

import 'save_to_do_item_usecase.dart';

class SaveToDoItemUseCaseImp implements SaveToDoItemUseCase {
  final SaveToDoItemRepository _saveToDoItemRepository;

  SaveToDoItemUseCaseImp(this._saveToDoItemRepository);

  @override
  Future<bool> call(ToDoItemEntity item,
      {required ToDoListEntity currentList}) {
    return _saveToDoItemRepository(item, currentList);
  }
}
