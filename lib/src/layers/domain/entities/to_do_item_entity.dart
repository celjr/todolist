class ToDoItemEntity {
  int? id;
  final String title;
  final String descrition;
  late bool isComplete;

  ToDoItemEntity(
      {this.id,
      required this.title,
      this.descrition = '',
      this.isComplete = false});

  void completed() => isComplete = !isComplete;

  bool get isCompleted => isComplete;
}
