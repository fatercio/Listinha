import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:flutter/material.dart';

import 'package:rx_notifier/rx_notifier.dart';

class AppStore {
  final syncDate = RxNotifier<DateTime?>(null);
  final themeMode = RxNotifier(ThemeMode.system);
  final taskBoardList = RxNotifier<List<TaskBoard>?>(null);
}
