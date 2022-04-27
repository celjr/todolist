import 'package:todolist/src/layers/domain/repositories/remove_to_do_list_repository.dart';
import 'package:todolist/src/layers/domain/usecases/remove_to_do_list/remove_to_do_list_usecase.dart';

import '../../entities/to_do_list_entity.dart';

class RemoveToDoListUsecaseImp implements RemoveToDoListUsecase {
  final RemoveToDoListRepository _removeToDoListRepository;

  RemoveToDoListUsecaseImp(this._removeToDoListRepository);

  @override
  Future<bool> call(ToDoListEntity list) async {
    return await _removeToDoListRepository(list);
  }
}
