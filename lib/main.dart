import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/domain/model/todos.dart';
import 'package:todo/domain/usecase/todos/load_todos_use_case.dart';
import 'package:todo/presentation/page/home_page_route.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initDatabase() async {
  locator.registerSingleton<Todos>(Todos());

  await Hive.initFlutter();
  await Hive.openBox('todos');

  final todos = locator<Todos>();
  await LoadTodosUseCase(todos: todos).call();

  // int newId = CreateNewTodoUseCase(todos: todos).call();
  // UpdateTitleUseCase(
  //     todo: todos.getTodos()[newId], title: 'never do this');
  // UpdateDescriptionUseCase(
  //     todo: todos.getTodos()[newId], description: 'gsdno inj rirnv rji ehrinnifresousniuiwruinruvbvn kjn ufnriuvhn u h eigunn igeiurh  nv riogh nj ui hegivnf gnieugih\n\n\njdgjig uihuv rjbui neren uibgsdno inj rirnv rji ehrinnifresousniuiwruinruvbvn kjn ufnriuvhn u h eigunn igeiurh  nv riogh nj ui hegivnf gnieugih\n\n\njdgjig uihuv rjbui neren uib');

  // await SaveTodosUseCase(todos: todos).call();
}

Future<void> main() async {
  await initDatabase();
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins"
        ),
        home: const HomePageRoute(),
      ),
    ),
  );
}
