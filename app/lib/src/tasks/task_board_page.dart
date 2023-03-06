import 'package:app/src/tasks/widget/list_task_item.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../shared/services/realm/models/task_model.dart';

class TaskBoardPage extends StatelessWidget {
  late final TaskBoard taskBoard;
  // const TaskBoardPage({super.key, required this.board});
  final board = TaskBoard(Uuid.v4(), 'Lista de Tarefas Teste', tasks: [
    Task(Uuid.v4(), 'Tarafas testes', complete: false),
    Task(Uuid.v4(), 'Tarafas testes', complete: false),
    Task(Uuid.v4(), 'Tarafas testes', complete: true),
    Task(Uuid.v4(), 'Tarafas testes', complete: true),
  ]);

  TaskBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listinha'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(
                board.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.9),
                ),
              ),
            ),
            ListView.separated(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                  bottom: 1,
                ),
                itemBuilder: (_, index) {
                  return ListTaskItem(theme: theme, task: board.tasks[index]);
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 2,
                  );
                },
                itemCount: 4),
          ],
        ),
      ),
    );
  }
}
