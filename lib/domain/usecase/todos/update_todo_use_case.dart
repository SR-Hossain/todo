import 'package:todo/data/datasource/local/source/save_todos_map_in_hive.dart';
import 'package:todo/domain/model/todos.dart';
import 'package:todo/domain/usecase/todo/update_description_use_case.dart';
import 'package:todo/domain/usecase/todo/update_title_use_case.dart';
import 'package:todo/domain/usecase/todos/save_todos_use_case.dart';

class UpdateTodoUseCase {
  final todos;
  final todo;
  final title;
  final description;
  UpdateTodoUseCase({
    required this.todos,
    required this.todo,
    required this.title,
    required this.description,
  });

  Future<void> call() async {
    UpdateTitleUseCase(todo: todo, title: title);
    UpdateDescriptionUseCase(todo: todo, description: description);

    await SaveTodosUseCase(todos: todos).call();
  }
}
