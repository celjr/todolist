import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

import '../dtos/todo_list_dto.dart';

abstract class GetAllToDoListDataSource {
  Future<List<ToDoListEntity>> call();
}
