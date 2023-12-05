import 'package:todo/domain/model/todos.dart';
import 'package:todo/domain/usecase/todo/toggle_complete_use_case.dart';
import 'package:todo/domain/usecase/todos/save_todos_use_case.dart';

class MarkTodoUseCaseDone {
  Todos todos;
  final int id;
  MarkTodoUseCaseDone({required this.todos, required this.id});

  Future<Todos> call() async {
    List toBeMarked =
        todos.getTodos().where((element) => element.id == id).toList();
    print('bojhe ${toBeMarked[0].isComplete}');
    if (toBeMarked.isNotEmpty) {
      ToggleCompleteUseCase(todo: toBeMarked[0]);
    }

    await SaveTodosUseCase(todos: todos).call();
    return todos;
  }
}
