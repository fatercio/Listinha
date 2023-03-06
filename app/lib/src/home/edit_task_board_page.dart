import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:app/src/shared/store/app_store.dart';
import 'package:app/src/tasks/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

class EditTaskBoardPage extends StatelessWidget {
  const EditTaskBoardPage({Key? key}) : super(key: key);

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
  final controller = TaskController();
  final appStore = Modular.get<AppStore>();

  bool isChecked = false;
  final TaskBoard taskBoard = TaskBoard(Uuid.v4(), '');

  @override
  void dispose() {
    super.dispose();
  }

  void saveTaskBoard() {
    controller.save(taskBoard);
    controller.sync();
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
              taskBoard.title = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
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
                    SnackBar(content: Text(taskBoard.title)),
                  );

                  saveTaskBoard();
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
