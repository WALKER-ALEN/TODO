import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/core/model/todo_model.dart';
import 'package:riverpod_todo/core/providers/todo_riverpod.dart';
import 'package:riverpod_todo/core/widgets/page.dart';

// ignore: must_be_immutable
class TodoRiverpodHome extends ConsumerWidget {
  TodoRiverpodHome({super.key});
  TextEditingController controll = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoModel> todos = ref.watch(todosProvider);
    

    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
        centerTitle: true,
      ),
      body: todos.isEmpty
          ? Center(
              child: Text("Empty Todo"),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    leading: Checkbox(
                        value: todos[index].isComplete,
                        onChanged: (value) {
                          print(value);
                          ref
                              .read(todosProvider.notifier)
                              .toggle(value!, index);
                        }),
                    title: Text(todos[index].task),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final controll = TextEditingController(
                                      text: todos[index].task);
                                  return AlertDialog(
                                    content: TextField(
                                        expands: true,
                                        maxLines: null,
                                        minLines: null,
                                        controller: controll),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            ref
                                                .read(todosProvider.notifier)
                                                .edit(
                                                    TodoModel(
                                                        task: controll.text),
                                                    index);
                                            Navigator.pop(context);
                                          },
                                          child: Text("Update")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel"))
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              ref.read(todosProvider.notifier).delete(index);
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoPage(
                  isEdit: false,
                ),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
