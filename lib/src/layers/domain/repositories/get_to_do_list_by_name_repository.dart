import '../entities/to_do_list_entity.dart';

abstract class GetAllToDoListRepository {
  Future<List<ToDoListEntity>> call();
}
