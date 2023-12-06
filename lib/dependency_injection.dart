import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/repository/local/hive/hive_data_source_implementation.dart';
import 'package:todo/domain/repository_interface/todo_repository_interface.dart';
import 'package:todo/domain/usecase/fetch_todo_use_case.dart';
import 'package:todo/domain/usecase/modify_todo_use_case.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencyInjections() async{

  await Hive.initFlutter();
  Box database = await Hive.openBox('todos');
  getIt.registerSingleton<Box>(database);


  getIt.registerSingleton<TodoRepositoryInterface>(
    HiveDataSourceImplementation(),
  );


  getIt.registerSingleton<FetchTodoUseCase>(
    FetchTodoUseCase(
      todoRepositoryInterface: getIt<TodoRepositoryInterface>(),
    ),
  );
  
  
  getIt.registerSingleton<ModifyTodoUseCase>(
    ModifyTodoUseCase(
      todoRepositoryInterface: getIt<TodoRepositoryInterface>(),
    ), 
  );


}
