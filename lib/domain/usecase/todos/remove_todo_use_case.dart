import 'package:todo/domain/model/todos.dart';
import 'package:todo/domain/usecase/todos/save_todos_use_case.dart';

class RemoveTodoUseCase {
  bool removalSuccessful = false;
  Todos todos;
  final int id;
  RemoveTodoUseCase({required this.todos, required this.id});

  Future<Todos> call() async {
    todos.getTodos().removeWhere((element) => element.id == id);
    await SaveTodosUseCase(todos: todos).call();
    removalSuccessful = true;
    return todos;
  }
}
