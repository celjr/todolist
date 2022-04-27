import '../entities/to_do_list_entity.dart';

abstract class SaveToDoListRepository {
  Future<bool> call(ToDoListEntity toDoListEntity);
}
