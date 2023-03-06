import 'package:flutter/material.dart';

import 'package:rx_notifier/rx_notifier.dart';

class AppStore {
  final syncDate = RxNotifier<DateTime?>(null);
  final themeMode = RxNotifier(ThemeMode.system);
}
