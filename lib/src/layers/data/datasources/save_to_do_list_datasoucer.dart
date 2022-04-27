import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

abstract class SaveToDoListDataSource {
  Future<bool> call(ToDoListEntity toDoListEntity);
}
