import 'package:provider/provider.dart';

import 'package:todolist/src/layers/data/datasources/remove_to_do_item_datasource.dart';

import '../layers/data/datasources/get_all_to_do_list_datasource.dart';
import '../layers/data/datasources/local/get_all_to_do_list_sqlite_datasourcer.dart';
import '../layers/data/datasources/local/remove_to_do_item_sqlite_datasource.dart';
import '../layers/data/datasources/local/remove_to_do_list_sqlite_datasource.dart';
import '../layers/data/datasources/local/save_to_do_item_sqlite_datasourcer.dart';
import '../layers/data/datasources/local/save_to_do_list_sqlite_datasoucer.dart';
import '../layers/data/datasources/local/update_complete_state_sqlite_datasource.dart';
import '../layers/data/datasources/remove_to_do_list_datasource.dart';
import '../layers/data/datasources/save_to_do_item_datasource.dart';
import '../layers/data/datasources/save_to_do_list_datasoucer.dart';
import '../layers/data/datasources/update_complete_state_datasource.dart';
import '../layers/data/repositories/get_all_to_do_list_repository_imp.dart';
import '../layers/data/repositories/remove_to_do_item_repository_imp.dart';
import '../layers/data/repositories/remove_to_do_list_repository_imp.dart';
import '../layers/data/repositories/save_to_do_item_repository_imp.dart';
import '../layers/data/repositories/save_to_do_list_repository_imp.dart';
import '../layers/data/repositories/update_complete_state_repository_imp.dart';
import '../layers/domain/repositories/get_to_do_list_by_name_repository.dart';
import '../layers/domain/repositories/remove_to_do_item_repository.dart';
import '../layers/domain/repositories/remove_to_do_list_repository.dart';
import '../layers/domain/repositories/save_to_do_item_repository.dart';
import '../layers/domain/repositories/save_to_do_list_repository.dart';
import '../layers/domain/repositories/update_complete_state_repository.dart';
import '../layers/domain/usecases/get_to_do_list_by_name/get_to_do_list_by_name_usecase.dart';
import '../layers/domain/usecases/get_to_do_list_by_name/get_to_do_list_by_name_usecase_imp.dart';
import '../layers/domain/usecases/remove_to_do_item/remove_to_do_item_usecase.dart';
import '../layers/domain/usecases/remove_to_do_item/remove_to_do_item_usecase_imp.dart';
import '../layers/domain/usecases/remove_to_do_list/remove_to_do_list_usecase.dart';
import '../layers/domain/usecases/remove_to_do_list/remove_to_do_list_usecase_imp.dart';
import '../layers/domain/usecases/save_to_do_item/save_to_do_item_usecase.dart';
import '../layers/domain/usecases/save_to_do_item/save_to_do_item_usecase_imp.dart';
import '../layers/domain/usecases/save_to_do_list/save_to_do_list_usacase.dart';
import '../layers/domain/usecases/save_to_do_list/save_to_do_list_usecase_imp.dart';
import '../layers/domain/usecases/update_complete_state/update_complete_state_usecase.dart';
import '../layers/domain/usecases/update_complete_state/update_complete_state_usecase_imp.dart';
import '../layers/presetation/controllers/to_do_list_controller.dart';

final toDoListControllerModule = [
  // getallTodoList
  Provider<GetAllToDoListDataSource>(
      create: (context) => GetAllToDoListSqliteDataSourceImp()),
  Provider<GetAllToDoListRepository>(
      create: (context) => GetAllToDoListRepositoryImp(context.read())),
  Provider<GetAllToDoListUsecase>(
      create: (context) => GetAllToDoListUsecaseImp(context.read())),
  //saveTodoList
  Provider<SaveToDoListDataSource>(
      create: (context) => SaveToDoListSqliteDataSource()),
  Provider<SaveToDoListRepository>(
      create: (context) => SaveToDoListRepositoryImp(context.read())),
  Provider<SaveToDoListUseCase>(
      create: (context) => SaveToDoListUseCaseImp(context.read())),
  //saveTodoItem
  Provider<SaveToDoItemDataSource>(
      create: (context) => SaveToDoItemSqliteDataSource()),
  Provider<SaveToDoItemRepository>(
      create: (context) => SaveToDoItemRepositoryImp(context.read())),
  Provider<SaveToDoItemUseCase>(
      create: (context) => SaveToDoItemUseCaseImp(context.read())),
  //removeTodoItem
  Provider<RemoveToDoItemDataSource>(
      create: (context) => RemoveToDoItemSqliteDataSource()),
  Provider<RemoveToDoItemRepository>(
      create: (context) => RemoveToDoItemRepositoryImp(context.read())),
  Provider<RemoveToDoItemUsecase>(
      create: (context) => RemoveToDoItemUsecaseImp(context.read())),
  //removeTodoList
  Provider<RemoveToDoListDatasource>(
      create: (context) => RemoveToDoListSqliteDatasource()),
  Provider<RemoveToDoListRepository>(
      create: (context) => RemoveToDoListRepositoryImp(context.read())),
  Provider<RemoveToDoListUsecase>(
      create: (context) => RemoveToDoListUsecaseImp(context.read())),
  //updatecompletstate
  Provider<UpdateCompleteStateDataSource>(
      create: (context) => UpdateCompleteStateSqliteDataSource()),
  Provider<UpdateCompleteStateRepository>(
      create: (context) => UpdateCompleteStateRepositoryImp(context.read())),
  Provider<UpdateCompleteStateUsecase>(
      create: (context) => UpdateCompleteStateUsecaseImp(context.read())),
  ChangeNotifierProvider(
      create: (context) => ToDoListController(context.read(), context.read(),
          context.read(), context.read(), context.read(), context.read()))
];

class RemoveToDoListDataSource {}
