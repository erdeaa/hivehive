import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivehive/add_todo_list_screen.dart';
import 'package:hivehive/todo.dart';

import 'main.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Todo List'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Todo>(boxName).listenable(),
        builder: (context, box, child) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text('Oops! Seems empty like your head'),
            );
          }
          return _buildTodoList(box);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodoListScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodoList(Box<Todo> box) {
    return ListView.builder(
      itemCount: box.values.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            box.deleteAt(index);
          },
          background: Container(
            color: Color.fromARGB(255, 3, 216, 197),
          ),
          child: ListTile(
            title: Text(box.getAt(index)!.title),
            subtitle: Text(box.getAt(index)!.description),
          ),
        );
      },
    );
  }
}
