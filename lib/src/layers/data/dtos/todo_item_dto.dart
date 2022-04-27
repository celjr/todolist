import '../../domain/entities/to_do_item_entity.dart';

class ToDoItemDto extends ToDoItemEntity {
  @override
  int? id;
  String title;
  String description;
  bool isComplete;

  ToDoItemDto(
      {required this.title,
      this.description = '',
      this.id,
      this.isComplete = false})
      : super(
            title: title,
            descrition: description,
            id: id,
            isComplete: isComplete);

  static Map toMap(ToDoItemEntity item) {
    return {
      'title': item.title,
      'descripion': item.descrition,
      'completed': item.isCompleted
    };
  }

  static ToDoItemDto fromMap(Map map) {
    ToDoItemDto result =
        ToDoItemDto(title: map['title'], description: map['description']);
    map['completed'] ? result.completed() : null;
    return result;
  }
}
