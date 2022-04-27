import '../../entities/to_do_list_entity.dart';
import '../../repositories/get_to_do_list_by_name_repository.dart';
import 'get_to_do_list_by_name_usecase.dart';

class GetAllToDoListUsecaseImp implements GetAllToDoListUsecase {
  final GetAllToDoListRepository _getAllToDoListRepository;

  GetAllToDoListUsecaseImp(this._getAllToDoListRepository);

  @override
  Future<List<ToDoListEntity>> call() {
    return _getAllToDoListRepository();
  }
}
