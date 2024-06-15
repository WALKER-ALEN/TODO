// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/core/model/todo_model.dart';

final todosProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void add(TodoModel todoz) {
    final todos = state;
    todos.add(todoz);
    state = List.from(todos);
  }

  void delete(int index) {
    final todos = state;
    todos.removeAt(index);
    state = List.from(todos);
  }

  void toggle(bool complete, int index) {
    final todos = state;
    todos[index] = state[index].copyWith(isComplete: complete);
    state = List.from(todos);
  }

  void edit(TodoModel newTodo, int index) {
    final todos = state;
    todos[index] = newTodo;

    state = List.from(todos);
  }
  void selectedDelete(){
   
  }
}
