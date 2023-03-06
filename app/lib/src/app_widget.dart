import 'package:app/src/configurations/service/configuration_service.dart';
import 'package:app/src/shared/store/app_store.dart';
import 'package:app/src/shared/themes/themes.dart';
import 'package:app/src/tasks/service/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final config = Modular.get<ConfigurationService>();
  final taskService = Modular.get<TaskService>();
  final appStore = Modular.get<AppStore>();

  @override
  void initState() {
    config.init();
    taskService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');
    context.select(() => {appStore.themeMode.value});

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
