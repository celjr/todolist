import '../../entities/to_do_list_entity.dart';

abstract class SaveToDoListUseCase {
  Future<bool> call(ToDoListEntity toDoListEntity);
}
