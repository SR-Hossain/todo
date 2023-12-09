import 'package:todo/domain/model/todo.dart';

class TodoModel implements Todo {
  Map toMap() => {
        'title': title,
        'description': description,
        'isComplete': isComplete,
      };

  @override
  String description;

  @override
  bool isComplete;

  @override
  String title;

  TodoModel({this.title='', this.description='', this.isComplete=false});
}


