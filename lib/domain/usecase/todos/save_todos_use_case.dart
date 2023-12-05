import 'package:todo/data/datasource/local/source/save_todos_map_in_hive.dart';

class SaveTodosUseCase {
  final todos;
  SaveTodosUseCase({required this.todos});
  
  Future<void> call() async{
    List updatedTodoMap = todos
        .getTodos()
        .map((todo) => {
              'id': todo.id,
              'title': todo.title,
              'description': todo.description,
              'isComplete': todo.isComplete,
            })
        .toList();

    await SaveTodosListInHive(updatedTodoList: updatedTodoMap).call();
  }
}
