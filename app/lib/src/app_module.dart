import 'package:app/src/configurations/configuration_page.dart';
import 'package:app/src/home/widgets/home_module.dart';
import 'package:app/src/shared/services/realm/realm_config.dart';
import 'package:app/src/shared/store/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

import 'configurations/service/configuration_service.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.factory<ConfigurationService>(
          (i) => ConfigurationServiceImpl(i()),
        ),
        Bind.singleton((i) => AppStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        )
      ];
}
