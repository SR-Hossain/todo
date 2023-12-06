import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/dependency_injection.dart';
import 'package:todo/presentation/page/home_page_route.dart';

main() async{
  await initDependencyInjections();
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        //
        theme: ThemeData(fontFamily: "Poppins"),
        //

        home: const HomePageRoute(),
      ),
    ),
  );
}
