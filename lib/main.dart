import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivehive/todo.dart';
import 'package:hivehive/todo_list_screen.dart';

var boxName = 'TodoBox';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Todo>(TodoAdapter());
  await Hive.openBox<Todo>(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: const ColorScheme.dark()),
      home: const TodoListScreen(),
    );
  }
}
