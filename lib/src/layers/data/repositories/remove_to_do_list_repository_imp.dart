import '../../domain/entities/to_do_list_entity.dart';
import '../../domain/repositories/remove_to_do_list_repository.dart';
import '../datasources/remove_to_do_list_datasource.dart';

class RemoveToDoListRepositoryImp implements RemoveToDoListRepository {
  final RemoveToDoListDatasource _removeToDoListDatasource;

  RemoveToDoListRepositoryImp(this._removeToDoListDatasource);

  @override
  Future<bool> call(ToDoListEntity list) async {
    return await _removeToDoListDatasource(list);
  }
}
