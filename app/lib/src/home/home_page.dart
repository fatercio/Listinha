import 'package:app/src/home/widgets/custom_draw.dart';
import 'package:app/src/home/widgets/task_card.dart';
import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:app/src/shared/wigets/user_image_button.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

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
        title: const Text('Listinha'),
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 100,
              ),
              itemBuilder: (_, index) {
                final board =
                    TaskBoard(Uuid.v4(), 'Nova Lista de Tarefas', tasks: [
                  Task(Uuid.v4(), 'Tarafas testes', complete: false),
                  Task(Uuid.v4(), 'Tarafas testes', complete: true),
                  Task(Uuid.v4(), 'Tarafas testes', complete: true),
                  Task(Uuid.v4(), 'Tarafas testes', complete: true),
                ]);
                return TaskCard(
                  board: board,
                  heigth: 140,
                );
              },
              separatorBuilder: (_, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 3,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<int>(
                  segments: const [
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
                  ],
                  selected: const {3},
                  onSelectionChanged: (values) => {1},
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
        label: const Text('Nova tarefa'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
