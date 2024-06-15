class TodoModel {
  String task;
  bool isComplete;
  TodoModel({required this.task, this.isComplete = false});

  TodoModel copyWith({
    String? task,
    bool? isComplete,
  }) {
    return TodoModel(
        task: task ?? this.task, isComplete: isComplete ?? this.isComplete);
  }
}
