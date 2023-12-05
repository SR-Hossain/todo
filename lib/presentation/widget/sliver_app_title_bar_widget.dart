import 'package:flutter/material.dart';
import 'package:todo/presentation/notifier/selected_todos_state_notifier.dart';
import 'package:todo/presentation/notifier/todos_state_notifier.dart';
import 'package:todo/presentation/page/todo_edit_page_route.dart';

class SliverAppTitleBarWidget extends StatelessWidget {
  final TodosStateNotifier todosStateNotifier;
  final SelectedTodosStateNotifier todoSelectionNotifier;
  const SliverAppTitleBarWidget(
      {super.key,
      required this.todosStateNotifier,
      required this.todoSelectionNotifier});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: const Text("To-Do",
              style: TextStyle(
                color: Colors.black,
                fontSize: 36.0,
              ) //TextStyle
              ), //Text
          background: Image.network(
            "https://gratisography.com/wp-content/uploads/2023/05/gratisography-blank-paper-free-stock-photo-1168x780.jpg",
            fit: BoxFit.cover,
          ) //Images.network
          ), //FlexibleSpaceBar
      expandedHeight: 230,
      backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      leading: IconButton(
        icon: const Icon(Icons.info),
        tooltip: 'Developer Info',
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible:
                false, // Set barrierDismissible to false to prevent dialog from closing by tapping outside
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
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
      ), //IconButton
      actions: todoSelectionNotifier.howManyTodoSelected() > 0
          ? [
              // Display buttons when at least one TodoTileWidget is selected
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                tooltip: 'Delete selected TodoTile(s)',
                onPressed: () async {
                  await todosStateNotifier
                      .removeTodos(todoSelectionNotifier.state);
                  todoSelectionNotifier.reset();
                },
              ),
              IconButton(
                icon: const Icon(Icons.check),
                color: Colors.green,
                tooltip: 'Mark selected TodoTile(s) as complete',
                onPressed: () async {
                  await todosStateNotifier
                      .markAsDone(todoSelectionNotifier.state);
                  todoSelectionNotifier.reset();
                },
              ),
              IconButton(
                icon: const Icon(Icons.close),
                color: Colors.black,
                tooltip: 'Mark selected TodoTile(s) as incomplete',
                onPressed: () {
                  todoSelectionNotifier.reset();
                },
              ),
            ]
          : [
              // Display default buttons when no TodoTileWidget is selected
              IconButton(
                icon: const Icon(Icons.add),
                color: Colors.white,
                tooltip: 'Add new todo',
                onPressed: () {
                  int id = todosStateNotifier.createNewBlankTodo();
                  // print('onpressed: $id');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoEditPageRoute(id: id),
                    ),
                  );
                },
              ),
            ],
    );
  }
}

// final Widget sliverAppTitleBarWidget = SliverAppBar(
//   pinned: true,
//   floating: false,
//   flexibleSpace: FlexibleSpaceBar(
//       centerTitle: false,
//       title: const Text("To-Do",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 36.0,
//           ) //TextStyle
//           ), //Text
//       background: Image.network(
//         "https://gratisography.com/wp-content/uploads/2023/05/gratisography-blank-paper-free-stock-photo-1168x780.jpg",
//         fit: BoxFit.cover,
//       ) //Images.network
//       ), //FlexibleSpaceBar
//   expandedHeight: 230,
//   backgroundColor: const Color.fromARGB(255, 255, 196, 0),
//   leading: IconButton(
//     icon: const Icon(Icons.menu),
//     tooltip: 'Menu',
//     onPressed: () {},
//   ), //IconButton
//   actions: ref.watch(selectedTodoTile) != null
//       ? [
//           // Display buttons when at least one TodoTileWidget is selected
//           IconButton(
//             icon: const Icon(Icons.delete),
//             color: Colors.white,
//             tooltip: 'Delete selected TodoTile(s)',
//             onPressed: (){},
//           ),
//           IconButton(
//             icon: const Icon(Icons.check),
//             color: Colors.white,
//             tooltip: 'Mark selected TodoTile(s) as complete',
//             onPressed: (){},
//           ),
//           IconButton(
//             icon: const Icon(Icons.close),
//             color: Colors.white,
//             tooltip: 'Mark selected TodoTile(s) as incomplete',
//             onPressed: (){},
//           ),
//         ]
//       : [
//           // Display default buttons when no TodoTileWidget is selected
//           IconButton(
//             icon: const Icon(Icons.add),
//             color: Colors.white,
//             tooltip: 'Add new todo',
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             tooltip: 'Setting Icon',
//             color: Colors.white,
//             onPressed: () {},
//           ),
//         ],
// );
