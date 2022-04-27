import '../../entities/to_do_list_entity.dart';

abstract class GetAllToDoListUsecase {
  Future<List<ToDoListEntity>> call();
}
