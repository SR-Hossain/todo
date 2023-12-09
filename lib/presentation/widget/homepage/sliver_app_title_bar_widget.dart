import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/notifier/selected_todo_notifier.dart';
import 'package:todo/presentation/notifier/todo_list_notifier.dart';
import 'package:todo/presentation/page/todo_edit_page.dart';

class SliverAppTitleBarWidget extends StatelessWidget {
  const SliverAppTitleBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding:
            const EdgeInsets.only(left: 30.0, bottom: 60.0), // Add padding to shift title left

        title: const Text(
          "To-Do",
          style: TextStyle(
            color: Colors.black,
            fontSize: 36.0,
          ),
        ),
        background: Image.asset(
          "assets/images/title_background.jpg",
          fit: BoxFit.cover,
        ),
      ),
      expandedHeight: 200,
      backgroundColor: const Color.fromARGB(255, 255, 196, 0),

      //

      leading: IconButton(
        icon: const Icon(Icons.info),
        tooltip: 'Developer Info',
        onPressed: () => showAdminInfo(context: context),
      ),

      //

      actions: [
        Consumer(
          builder: (context, ref, child) {
            return ref.watch(selectedTodoProvider).isEmpty
                ? IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.black,
                    tooltip: 'Add new todo',
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TodoEditPage(index: -1),
                        ),
                      );
                    })
                : Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        tooltip: 'Delete selected TodoTile(s)',
                        onPressed: () async{
                          await ref.read(todoListProvider.notifier).deleteSet(ref.read(selectedTodoProvider));
                          ref.read(selectedTodoProvider.notifier).reset();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.check),
                        color: Colors.green,
                        tooltip: 'Mark selected TodoTile(s) as complete',
                        onPressed: () async {
                          await ref.read(todoListProvider.notifier).toggleIsCompleteMarkedSet(ref.read(selectedTodoProvider));
                          ref.read(selectedTodoProvider.notifier).reset();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: Colors.black,
                        tooltip: 'Mark selected TodoTile(s) as incomplete',
                        onPressed: () => ref.read(selectedTodoProvider.notifier).reset(),
                      ),
                    ],
                  );
          },
          child: Text('This is a child widget'),
        ),
      ],
    );
  }

  handleDelete() {}
}


void showAdminInfo({required context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Todo v1.0'),
        content: const Text(
          // ignore: prefer_interpolation_to_compose_strings
          'Dev: Syed Sazid Hossain Rezvi\n' //
          'Email: ssh.rezvi@gmail.com\n\n' //
          'Offer me a coffee...\n' //
          'Bkash number: 018xxxxxxxx',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
