import 'package:app/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

abstract class ConfigurationService {
  ConfigurationModel getConfiguration();
  void saveConfiguration(String themeMode, DateTime? syncDate);
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService {
  final Realm realm;

  ConfigurationServiceImpl(this.realm);

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModelName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model.syncDate = syncDate;
      model.themeModelName = themeModelName;
    });
  }
}
