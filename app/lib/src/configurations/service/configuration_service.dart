import 'package:app/src/shared/services/realm/models/configuration_model.dart';
import 'package:app/src/shared/store/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class ConfigurationService {
  // ConfigurationModel getConfiguration();
  // void saveConfiguration(String themeMode, DateTime? syncDate);
  void init();
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService, Disposable {
  final Realm realm;
  final AppStore appStore;
  // late é para atribuir valor depois
  late final RxDisposer disposer;

  ConfigurationServiceImpl(this.realm, this.appStore);

  @override
  void init() {
    final model = _getConfiguration();
    appStore.themeMode.value = _getThemeModeByName(model.themeModelName);
    appStore.syncDate.value = model.syncDate;

    // Escuta as alterações de valor nas variáveis
    disposer = rxObserver(() {
      final themMode = appStore.themeMode.value;
      final syncDate = appStore.syncDate.value;
      _saveConfiguration(themMode.name, syncDate);
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  @override
  void dispose() {
    disposer();
  }

  ConfigurationModel _getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  void _saveConfiguration(String themeModelName, DateTime? syncDate) {
    final model = _getConfiguration();
    realm.write(() {
      model.syncDate = syncDate;
      model.themeModelName = themeModelName;
    });
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
