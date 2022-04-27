import 'package:sqflite/sqflite.dart';
import 'package:todolist/src/core/database/sqlite/db.dart';
import 'package:todolist/src/layers/domain/entities/to_do_list_entity.dart';

import '../../../domain/entities/to_do_item_entity.dart';
import '../../dtos/todo_list_dto.dart';
import '../get_all_to_do_list_datasource.dart';

class GetAllToDoListSqliteDataSourceImp implements GetAllToDoListDataSource {
  late Database db;
  final List<ToDoListEntity> _lists = [];

  @override
  Future<List<ToDoListEntity>> call() async {
    db = await DB.instance.database;
    List<Map> list = await db.query('todo_list');

    for (Map map in list) {
      List<Map> listItem = await db.rawQuery(
          'SELECT id, title, description, is_completed FROM todo_item WHERE list_id = ${map['id']} ');
      _lists.add(ToDoListEntity(name: map['name'], id: map['id'], itemList: [
        for (Map mapItem in listItem)
          ToDoItemEntity(
              title: mapItem['title'],
              descrition: mapItem['description'],
              id: mapItem['id'],
              isComplete: mapItem['is_completed'] == 1)
      ]));
    }

    return _lists;
  }
}
