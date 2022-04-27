import 'package:flutter/foundation.dart';
import 'package:todolist/src/layers/data/datasources/local/remove_to_do_list_sqlite_datasource.dart';
import 'package:todolist/src/layers/data/datasources/remove_to_do_list_datasource.dart';
import 'package:todolist/src/layers/domain/entities/to_do_item_entity.dart';
import 'package:todolist/src/layers/domain/usecases/get_to_do_list_by_name/get_to_do_list_by_name_usecase.dart';
import 'package:todolist/src/layers/domain/usecases/remove_to_do_item/remove_to_do_item_usecase.dart';
import 'package:todolist/src/layers/domain/usecases/remove_to_do_list/remove_to_do_list_usecase.dart';
import 'package:todolist/src/layers/domain/usecases/save_to_do_item/save_to_do_item_usecase.dart';
import 'package:todolist/src/layers/domain/usecases/save_to_do_list/save_to_do_list_usacase.dart';
import 'package:todolist/src/layers/domain/usecases/update_complete_state/update_complete_state_usecase.dart';

import '../../domain/entities/to_do_list_entity.dart';

class ToDoListController extends ChangeNotifier {
  final GetAllToDoListUsecase _getAllToDoListUsecase;
  final SaveToDoListUseCase _saveToDoListUseCase;
  final SaveToDoItemUseCase _saveToDoItemUseCase;
  final UpdateCompleteStateUsecase _updateCompleteStateUsecase;
  final RemoveToDoItemUsecase _removeToDoItemUsecase;
  final RemoveToDoListUsecase _removeToDoListUsecase;
  List<ToDoListEntity> toDoLists = [];

  ToDoListController(
    this._getAllToDoListUsecase,
    this._saveToDoListUseCase,
    this._saveToDoItemUseCase,
    this._updateCompleteStateUsecase,
    this._removeToDoItemUsecase,
    this._removeToDoListUsecase,
  );

  Future<bool> addToDo(ToDoItemEntity item, int currentList) async {
    bool result =
        await _saveToDoItemUseCase(item, currentList: toDoLists[currentList]);
    toDoLists[currentList].addItem(item);
    notifyListeners();
    return result;
  }

  removeToDo(int currentList, int itemIndex) {
    _removeToDoItemUsecase(toDoLists[currentList].list[itemIndex]);
    toDoLists[currentList].removeItem(itemIndex);

    notifyListeners();
  }

  removeList(ToDoListEntity list) {
    _removeToDoListUsecase(list);
    toDoLists.remove(list);

    notifyListeners();
  }

  completeToDo(int currentList, int index) {
    _updateCompleteStateUsecase(toDoLists[currentList].list[index]);
    toDoLists[currentList].list[index].completed();

    notifyListeners();
  }

  getAllToDoList() async {
    toDoLists = await _getAllToDoListUsecase();
    notifyListeners();
  }

  Future<bool> saveToDoList(ToDoListEntity list) async {
    bool result = await _saveToDoListUseCase(list);
    toDoLists.add(list);
    notifyListeners();
    return result;
  }
}
