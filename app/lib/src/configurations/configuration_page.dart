import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/store/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Florestal'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
              title: const Text('Sistema'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
              title: const Text('Claro'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
              title: const Text('Escuro'),
            ),
            const SizedBox(height: 25),
            Text(
              'Controle de Dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                appStore.changeThemeMode(ThemeMode.system);
              },
              child: const Text('Reuniciar o app'),
            ),
          ],
        ),
      ),
    );
  }
}
