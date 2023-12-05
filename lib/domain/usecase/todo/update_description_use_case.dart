import 'package:todo/domain/model/todo.dart';

class UpdateDescriptionUseCase {
  UpdateDescriptionUseCase({required Todo todo, required String description}) {
    todo.description = description;
  }
}