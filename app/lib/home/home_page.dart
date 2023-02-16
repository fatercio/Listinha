import 'package:app/home/widgets/custom_drawer.dart';
import 'package:app/src/shared/wigets/user_image_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
        title: const Text("Florestal"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SegmentedButton<int>(segments: const [
                ButtonSegment(
                  value: 0,
                  label: Text('Todos'),
                ),
                ButtonSegment(
                  value: 1,
                  label: Text('Pendentes'),
                ),
                ButtonSegment(
                  value: 2,
                  label: Text('Concluídas'),
                ),
                ButtonSegment(
                  value: 3,
                  label: Text('Desativados'),
                )
              ], selected: const {
                3
              }, onSelectionChanged: (valuesS) => {}),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Novo inventário"),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
