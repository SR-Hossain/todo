import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/dependency_injection.dart';
import 'package:todo/domain/repository_interface/todo_repository_interface.dart';

class HiveDataSourceImplementation implements TodoRepositoryInterface {
  @override
  List fetch() => getIt<Box>().get('list') ?? [];

  @override
  void save({required List<Map> todoList}) {
    var database = getIt<Box>();
    database.put('list', todoList);
  }
}
