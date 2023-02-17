import 'package:app/src/shared/services/realm/models/configuration_model.dart';
import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

LocalConfiguration config = Configuration.local(
  [ConfigurationModel.schema, Task.schema, TaskBoard.schema],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
);
