import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/core/model/todo_model.dart';
import 'package:riverpod_todo/core/providers/todo_riverpod.dart';

@immutable
class TodoPage extends ConsumerWidget {
  final bool isEdit;
  final int index;
  TodoPage({super.key, required this.isEdit, this.index = 0});
  TextEditingController controll = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<TodoModel> models = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    
                  },
                  icon: Icon(Icons.update)),
              IconButton(
                onPressed: () {
                  // ? ref

                  ref.read(todosProvider.notifier).add(TodoModel(
                        task: controll.text,
                      ));
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(color: Colors.black12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controll,
                expands: true,
                minLines: null,
                maxLines: null,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
