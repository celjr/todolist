import 'to_do_item_entity.dart';

class ToDoListEntity {
  int? id;
  late List<ToDoItemEntity> _list;
  final String name;

  ToDoListEntity(
      {this.id, List<ToDoItemEntity>? itemList, required this.name}) {
    if (itemList == null) {
      _list = [];
    } else {
      _list = itemList;
    }
  }

  List<ToDoItemEntity> get list => _list;

  void addItem(ToDoItemEntity item) {
    _list.add(item);
  }

  void removeItem(int index) {
    _list.removeAt(index);
  }

  double completedPerCent() {
    int countCompleted = 0;
    for (ToDoItemEntity i in _list) {
      if (i.isCompleted) {
        countCompleted++;
      }
    }

    return (countCompleted / _list.length) * 100;
  }
}
