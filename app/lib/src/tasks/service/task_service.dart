import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:app/src/shared/store/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class TaskService {
  init();
  saveTaskBoard(TaskBoard taskBoard);
  deleteTaskBoard(TaskBoard taskBoard);
}

class TaskServiceImpl implements TaskService, Disposable {
  final Realm realm;
  final AppStore appStore;
  late final RxDisposer disposer;

  TaskServiceImpl(
    this.realm,
    this.appStore,
  );

  @override
  init() {
    final model = _getAllTaskBoard();
    appStore.taskBoardList.value = model;
  }

  @override
  saveTaskBoard(TaskBoard taskBoard) {
    final model = _getAllTaskBoard();
    realm.write(() => realm.add(taskBoard));
  }

  @override
  deleteTaskBoard(TaskBoard taskBoard) {
    realm.write(() => realm.delete(taskBoard));
  }

  @override
  void dispose() {
    disposer();
  }

  List<TaskBoard> _getAllTaskBoard() {
    final list = realm.all<TaskBoard>();
    return list.toList();
  }

  TaskBoard? _getTaskBoard(Uuid id) {
    var taskboard = realm.find<TaskBoard>(id);
    return taskboard;
  }
}
