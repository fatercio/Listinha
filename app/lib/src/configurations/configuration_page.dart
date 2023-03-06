import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../shared/store/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appStore = Modular.get<AppStore>();

  void _changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode.value = mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => {appStore.themeMode.value});
    return Scaffold(
      appBar: AppBar(
        title: Text('Listinha'),
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
              onChanged: _changeThemeMode,
              title: const Text('Sistema'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              onChanged: _changeThemeMode,
              title: const Text('Claro'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              onChanged: _changeThemeMode,
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
                _changeThemeMode(ThemeMode.system);
              },
              child: const Text('Reuniciar o app'),
            ),
          ],
        ),
      ),
    );
  }
}
