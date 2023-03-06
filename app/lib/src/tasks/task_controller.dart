import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:app/src/tasks/service/task_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

class TaskController {
  final taskService = Modular.get<TaskService>();

  save(TaskBoard taskBoard) {
    taskService.saveTaskBoard(taskBoard);
    sync();
  }

  delete(TaskBoard taskBoard) {
    taskService.deleteTaskBoard(taskBoard);
    sync();
  }

  sync() {
    taskService.init();
  }
}
