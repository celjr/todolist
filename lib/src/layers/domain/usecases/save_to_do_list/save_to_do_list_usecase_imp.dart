import '../../entities/to_do_list_entity.dart';
import '../../repositories/save_to_do_list_repository.dart';
import 'save_to_do_list_usacase.dart';

class SaveToDoListUseCaseImp implements SaveToDoListUseCase {
  final SaveToDoListRepository _saveToDoListRepository;

  SaveToDoListUseCaseImp(this._saveToDoListRepository);

  @override
  Future<bool> call(ToDoListEntity toDoListEntity) async {
    return _saveToDoListRepository(toDoListEntity);
  }
}
