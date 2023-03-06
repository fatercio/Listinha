import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class EditTaskBoardPage extends StatefulWidget {
  const EditTaskBoardPage({Key? key}) : super(key: key);

  @override
  State<EditTaskBoardPage> createState() => _EditTaskBoardPageState();
}

class _EditTaskBoardPageState extends State<EditTaskBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listinha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: TaskForm(),
      ),
    );
  }
}

class TaskForm extends StatefulWidget {
  TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  final Task task = Task(Uuid.v4(), '', complete: true);
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (value) {
              task.description = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Checkbox(
            value: task.complete,
            onChanged: (bool? value) {
              setState(() {
                task.complete = value!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(task.description)),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
