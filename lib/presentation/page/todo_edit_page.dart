import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/notifier/todo_list_notifier.dart';

class TodoEditPage extends ConsumerStatefulWidget {
  final int index;
  const TodoEditPage(
      {super.key,
      required this.index,});

  @override
  ConsumerState createState() =>
      _TodoEditPageState(index: index);
}

class _TodoEditPageState extends ConsumerState {
  int index;
  _TodoEditPageState(
      {required this.index});

  @override
  Widget build(BuildContext context) {
    final title=index==-1?'':ref.read(todoListProvider)[index].title;
    final description=index==-1?'':ref.read(todoListProvider)[index].description;
    TextEditingController titleController = TextEditingController(text: title);
    TextEditingController descriptionController = TextEditingController(text: description);
// OnInvokeCallback(context)
    return PopScope(
      onPopInvoked: (bool x) async {
        await ref.read(todoListProvider.notifier).update(
              index: index,
              title:
                  titleController.text == title ? null : titleController.text,
              description: descriptionController.text == description
                  ? null
                  : descriptionController.text,
            );
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
