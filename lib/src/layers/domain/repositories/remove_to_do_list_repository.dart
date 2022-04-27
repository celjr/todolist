import '../entities/to_do_list_entity.dart';

abstract class RemoveToDoListRepository {
  Future<bool> call(ToDoListEntity list);
}
