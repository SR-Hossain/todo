import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/notifier/selected_todo_notifier.dart';
import 'package:todo/presentation/notifier/todo_list_notifier.dart';
import 'package:todo/presentation/page/todo_edit_page.dart';
import 'package:todo/presentation/widget/homepage/sliver_app_title_bar_widget.dart';
import 'package:todo/presentation/widget/homepage/todo_tile_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState {
  crossAxisCountBasedOnOrientation() =>
      MediaQuery.of(context).orientation == Orientation.landscape ? 4 : 2;

  void handleSingleTapOnTodoTile(index) {
    if (ref.read(selectedTodoProvider).isNotEmpty) {
      ref.read(selectedTodoProvider.notifier).markOrNot(index: index);
    } else {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => TodoEditPage(index: index),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppTitleBarWidget(),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCountBasedOnOrientation(),
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                int reversedIndex = ref.read(todoListProvider).length-1-index;
                return GestureDetector(
                  onTap: ()=>handleSingleTapOnTodoTile(reversedIndex),
                  onLongPress: () => ref
                      .read(selectedTodoProvider.notifier)
                      .markOrNot(index: reversedIndex),

                  //

                  child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.width / 3.2
                          : MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ref.watch(selectedTodoProvider).contains(reversedIndex)
                            ? Colors.orange
                            : ref.watch(todoListProvider)[reversedIndex].isComplete
                                ? Colors.green
                                : Colors.yellow,
                      ),

                      //

                      child: TodoTileWidget(
                        title: ref.watch(todoListProvider)[reversedIndex].title,
                        description:
                            ref.watch(todoListProvider)[reversedIndex].description,
                      )),
                );
              },

              //
              childCount: ref.read(todoListProvider).length,
            ),
          )
        ],
      ),
    );
  }
}
