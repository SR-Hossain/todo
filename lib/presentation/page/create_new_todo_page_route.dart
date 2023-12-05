import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNewTodoPageRoute extends ConsumerStatefulWidget {
  const CreateNewTodoPageRoute({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CreateNewTodoPageRoute();
  }
}

class _CreateNewTodoPageRoute extends ConsumerState<CreateNewTodoPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New todo")),
    );
  }
}
