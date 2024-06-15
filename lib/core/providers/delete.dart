// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_todo/core/providers/todo_riverpod.dart';

// final deleteSelectedTodoProvider = Provider<Function()>((ref) => () {
//   final context = ref.watch(navigatorKeyProvider);
//   final todos = ref.read(todosProvider);

//   // Show confirmation dialog (optional)
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text('Confirm Delete'),
//       content: Text('Are you sure you want to delete selected items?'),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             // Actually delete selected items
//             ref.read(todosProvider.notifier).((state) => state.where((todo) => !todo.isSelected).toList());
//             Navigator.pop(context);
//           },
//           child: Text('Delete'),
//         ),
//       ],
//     ),
//   );
// });