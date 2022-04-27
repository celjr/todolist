import 'package:todolist/src/layers/domain/repositories/remove_to_do_item_repository.dart';
import 'package:todolist/src/layers/domain/usecases/remove_to_do_item/remove_to_do_item_usecase.dart';

import '../../entities/to_do_item_entity.dart';
import '../../entities/to_do_list_entity.dart';

class RemoveToDoItemUsecaseImp implements RemoveToDoItemUsecase {
  final RemoveToDoItemRepository _removeToDoItemRepository;

  RemoveToDoItemUsecaseImp(this._removeToDoItemRepository);

  @override
  Future<bool> call(ToDoItemEntity item) {
    return _removeToDoItemRepository(item);
  }
}
