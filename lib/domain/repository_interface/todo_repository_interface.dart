abstract class TodoRepositoryInterface {
  List fetch();
  void save({required List<Map> todoList});
}
