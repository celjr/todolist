import '../../domain/entities/to_do_item_entity.dart';
import '../../domain/entities/to_do_list_entity.dart';
import '../../domain/repositories/get_to_do_list_by_name_repository.dart';
import '../datasources/get_all_to_do_list_datasource.dart';
import '../dtos/todo_list_dto.dart';

class GetAllToDoListRepositoryImp implements GetAllToDoListRepository {
  final GetAllToDoListDataSource _getAllToDoListDataSource;

  GetAllToDoListRepositoryImp(this._getAllToDoListDataSource);

  @override
  Future<List<ToDoListEntity>> call() async {
    return await _getAllToDoListDataSource();
  }
}
