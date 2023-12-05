import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/model/todos.dart';
import 'package:todo/domain/usecase/todos/save_todos_use_case.dart';

class CreateNewTodoUseCase {
  final Todos _todos;
  CreateNewTodoUseCase({required Todos todos}) : _todos = todos;
  int call({int? id}) {
    id ??= _todos.getTodos()[_todos.getTodosLength() - 1].id + 1;
    _todos.getTodos().add(Todo(
          id: id,
          title: '',
          description: '',
          isComplete: false,
        ));
    // await SaveTodosUseCase(todos: _todos).call();
    return id;
  }
}
