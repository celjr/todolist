import '../../entities/to_do_list_entity.dart';

abstract class RemoveToDoListUsecase {
  Future<bool> call(ToDoListEntity list);
}
