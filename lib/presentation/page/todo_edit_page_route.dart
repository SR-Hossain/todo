import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/provider/todos_state_notifier_provider.dart';

class TodoEditPageRoute extends ConsumerStatefulWidget {
  final int id;

  const TodoEditPageRoute({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TodoEditPageRouteState(id: id);
  }
}

class _TodoEditPageRouteState extends ConsumerState<TodoEditPageRoute> {
  final int id;

  _TodoEditPageRouteState({required this.id});

  @override
  Widget build(BuildContext context) {
    var todosStateNotifier = ref.watch(todosStateNotifierProvider.notifier);
    final String title = todosStateNotifier.todoTitle(id);
    final String description = todosStateNotifier.todoDescription(id);
    final TextEditingController titleController =
        TextEditingController(text: title);
    final TextEditingController descriptionController =
        TextEditingController(text: description);

    return PopScope(
      onPopInvoked: (bool x) async {
        await todosStateNotifier.updateTodo(
            id: id,
            title: titleController.text,
            description: descriptionController.text);
      },
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: TextFormField(
            controller: titleController,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: "Add Title",
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          backgroundColor: Colors.yellow,
        ),
        //

        body: TextFormField(
          controller: descriptionController,
          maxLines: null,
          decoration: const InputDecoration(
            hintText: "Add description",
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
