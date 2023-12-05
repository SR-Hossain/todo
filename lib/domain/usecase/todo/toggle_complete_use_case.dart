import 'package:todo/domain/model/todo.dart';

class ToggleCompleteUseCase {
  ToggleCompleteUseCase({required Todo todo}) {
    todo.isComplete ^= true; 
    
  }
}

