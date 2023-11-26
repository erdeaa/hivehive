import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivehive/todo.dart';

import 'main.dart';

class AddTodoListScreen extends StatefulWidget {
  const AddTodoListScreen({super.key});

  @override
  State<AddTodoListScreen> createState() => _AddTodoListScreenState();
}

class _AddTodoListScreenState extends State<AddTodoListScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Todo List'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              var newTodo = Todo(
                title: titleController.text,
                description: descriptionController.text,
              );
              Hive.box<Todo>(boxName).add(newTodo);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 3, 216, 197),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
