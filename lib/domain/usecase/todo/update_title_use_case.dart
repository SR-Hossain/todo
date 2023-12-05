import 'package:todo/domain/model/todo.dart';

class UpdateTitleUseCase {
  UpdateTitleUseCase({required Todo todo, required String title}) {
    todo.title = title;
  }
}
