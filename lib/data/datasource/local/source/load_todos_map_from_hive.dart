import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/repository/local/todos_local_data_source.dart';

class LoadTodosMapFromHive implements TodosLocalDataSource {
  @override
  Future<List> call() async {
    var database = await Hive.openBox('todos');
    var todoList = await database.get('list');
    todoList ??= [];
    return todoList;
  }
}
