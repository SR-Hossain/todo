import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/repository/local/todos_local_data_source.dart';

class SaveTodosListInHive implements TodosLocalDataSource {
  List updatedTodoList;
  SaveTodosListInHive({required this.updatedTodoList});

  @override
  Future<void> call() async {
    var database = await Hive.openBox('todos');
    database.put('list', updatedTodoList);
    database.close();
    print('save e ashse');
  }
}
