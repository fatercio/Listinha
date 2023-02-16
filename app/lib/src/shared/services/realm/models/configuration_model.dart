import 'package:realm/realm.dart';
part 'configuration_model.g.dart';

@RealmModel()
class _ConfigurationModel {
  late String themeModelName;
  late DateTime? syncDate;
}
