import 'package:flutter/material.dart';

import 'package:app/src/configurations/service/configuration_service.dart';

class AppStore {
  final syncDate = ValueNotifier<DateTime?>(null);
  final themeMode = ValueNotifier(ThemeMode.system);

  final ConfigurationService _configurationService;

  AppStore(this._configurationService) {
    init();
  }
  void save() {
    _configurationService.saveConfiguration(
        themeMode.value.name, syncDate.value);
  }

  void init() {
    final model = _configurationService.getConfiguration();
    syncDate.value = model.syncDate;
    themeMode.value = _getThemeModeByName(model.themeModelName);
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }
}

ThemeMode _getThemeModeByName(String name) {
  return ThemeMode.values.firstWhere((mode) => mode.name == name);
}
