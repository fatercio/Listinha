import 'package:app/src/home/widgets/custom_draw.dart';
import 'package:app/src/home/widgets/task_card.dart';
import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:app/src/shared/wigets/user_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';
import '../shared/store/app_store.dart';
import '../tasks/task_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appStore = Modular.get<AppStore>();
  final taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    context.select(() => {appStore.taskBoardList.value});
    final theme = Theme.of(context);
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
            if (appStore.taskBoardList.value != null)
              if (!appStore.taskBoardList.value!.isEmpty)
                ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: 100,
                  ),
                  itemBuilder: (_, index) {
                    return Dismissible(
                      key: ValueKey(appStore.taskBoardList.value![index]),
                      child: TaskCard(
                        board: appStore.taskBoardList.value![index],
                        heigth: 140,
                      ),
                      onDismissed: (value) => {
                        taskController.delete(appStore.taskBoardList
                            .value![index]), // Then show a snackbar.
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Deletado")))
                      },
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: appStore.taskBoardList.value!.length,
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
          ///Navigator.of(context).pushNamed('./edit');

          final taskBoard = new TaskBoard(Uuid.v4(), '');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        taskController.save(taskBoard);
                        taskController.sync();
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                  scrollable: true,
                  title: Text('Nova Lista de Tarfas',
                      style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.bodySmall?.color
                              ?.withOpacity(0.9))),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            onChanged: (value) {
                              taskBoard.title = value;
                            },
                            style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.normal,
                                color: theme.textTheme.bodySmall?.color
                                    ?.withOpacity(0.9)),
                            decoration: const InputDecoration(
                                labelText: 'Nome da tarefa',
                                icon: Icon(Icons.task)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        label: const Text('Nova tarefa'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}

class FormDialog extends StatelessWidget {
  const FormDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
