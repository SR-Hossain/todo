import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/dependency_injection.dart';
import 'package:todo/presentation/page/homepage.dart';

Future<void> main() async {
  await initDatabase();
  injectDataSourceDependencyIntoRepository();
  injectRepositoryDependencyIntoUseCase();


  runApp(ProviderScope(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,

    //
    theme: ThemeData(fontFamily: "Poppins"),
    //

    home: const HomePage(),
  )));
}
