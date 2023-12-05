import 'package:todo/data/datasource/local/source/load_todos_map_from_hive.dart';
import 'package:todo/domain/model/todo.dart';

class LoadTodosUseCase {
  final todos;
  LoadTodosUseCase({required this.todos});

  Future<void> call() async {
    List<Todo> todoList = [];
    for (var todo in await LoadTodosMapFromHive().call()) {
      todoList.add(Todo(
        id: todo['id'],
        title: todo['title'],
        description: todo['description'],
        isComplete: todo['isComplete'],
      ));
    }
    await todos.setTodos(todoList);
  }
}
