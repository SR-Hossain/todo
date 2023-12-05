import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/page/todo_edit_page_route.dart';
import 'package:todo/presentation/provider/selected_todos_state_notifier_provider.dart';
import 'package:todo/presentation/provider/todos_state_notifier_provider.dart';
import 'package:todo/presentation/widget/sliver_app_title_bar_widget.dart';
import 'package:todo/presentation/widget/todo_tile_widget.dart';

class HomePageRoute extends ConsumerStatefulWidget {
  const HomePageRoute({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePageRoute> {
  @override
  Widget build(BuildContext context) {
    var todos = ref.watch(todosStateNotifierProvider).getTodos();
    var todosStateNotifier = ref.watch(todosStateNotifierProvider.notifier);
    var todoSelectionNotifier =
        ref.watch(selectedTodosStateNotifierProvider.notifier);

    var selectedTodoList = ref.watch(selectedTodosStateNotifierProvider);
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppTitleBarWidget(
          todosStateNotifier: todosStateNotifier,
          todoSelectionNotifier: todoSelectionNotifier,
          // ref.watch(selectedTodosStateNotifierProvider).length,
        ),
        //

        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 4
                      : 2),
          delegate: SliverChildBuilderDelegate(
            (context, index) => GestureDetector(
              //ontap

              onTap: () {
                int id = todosStateNotifier.getId(todos.length - 1 - index);
                if (selectedTodoList.isNotEmpty) {
                  ref
                      .watch(selectedTodosStateNotifierProvider.notifier)
                      .processIndex(id);
                } else {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => TodoEditPageRoute(id: id),
                    ),
                  );
                }
              },

              onLongPress: () {
                int id = todosStateNotifier.getId(todos.length - 1 - index);
                ref
                    .read(selectedTodosStateNotifierProvider.notifier)
                    .processIndex(id);
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width / 3.2
                      : MediaQuery.of(context).size.width / 2.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: todoSelectionNotifier.isSelected(todosStateNotifier
                            .state
                            .getTodos()[todos.length - 1 - index]
                            .id)
                        ? Colors.orange
                        : todosStateNotifier.state
                                .getTodos()[todos.length - 1 - index]
                                .isComplete
                            ? Colors.green
                            : Colors.yellow,
                  ),

                  //

                  child: TodoTileWidget(
                    title: todosStateNotifier.state
                        .getTodos()[todos.length - 1 - index]
                        .title,
                    description: todosStateNotifier.state
                        .getTodos()[todos.length - 1 - index]
                        .description,
                  )),
            ),

            //
            childCount: todos.length,
          ),
        )
      ],
    ) //CustonScrollView
        ); //Scaffold
  }
}
