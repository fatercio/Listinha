import 'package:app/src/shared/store/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.syncDate,
    );

    var syncDateText = 'Nunca';
    final syncDate = appStore.syncDate.value;

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy as hh:mm');
      syncDateText = format.format(syncDate);
    }

    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, right: 16, left: 16, bottom: 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: SizedBox(
            width: 201,
            child: Row(
              children: [
                const Text('Sincronizar'),
                const Spacer(),
                Text(
                  syncDateText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
