import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:flutter/material.dart';

enum TaskCardStatus {
  pending(Icons.access_time, 'Pendente'),
  complete(Icons.check, 'Completa'),
  disable(Icons.cancel_outlined, 'Desativada');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}

class TaskCard extends StatelessWidget {
  final TaskBoard board;
  final double heigth;
  const TaskCard({super.key, required this.board, this.heigth = 140});

  double getProgess(List<Task> tasks) {
    if (tasks.isEmpty) return 0;
    final completes = tasks.where((task) => task.complete).length;
    return completes / tasks.length;
  }

  String getProgressText(List<Task> tasks) {
    final completes = tasks.where((task) => task.complete).length;
    return '$completes / ${tasks.length}';
  }

  TaskCardStatus getStatus(TaskBoard board, double progress) {
    if (!board.enable) {
      return TaskCardStatus.disable;
    } else if (progress < 1.0) {
      return TaskCardStatus.pending;
    } else {
      return TaskCardStatus.complete;
    }
  }

  Color getBackgrounColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.complete:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.disable:
        return theme.colorScheme.errorContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.complete:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.disable:
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Processo de criação de widget é simples quando define as varíveis que serão substituidas no primeiro momento
    // Poderia fazer a substituição pelo objeto board, mas não ficaria bem legível para fins de estudo

    final theme = Theme.of(context);
    final progress = getProgess(board.tasks);
    final progressText = getProgressText(board.tasks);
    final title = board.title;
    final status = getStatus(board, progress);

    final iconData = status.icon;
    final statusText = status.text;
    final backgroundColor = getBackgrounColor(status, theme);
    final color = getColor(status, theme);

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('./boardview'),
      child: Container(
        height: heigth,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: theme.iconTheme.color?.withOpacity(0.5),
                ),
                const Spacer(),
                Text(
                  statusText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            if (board.tasks.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    color: color,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    progressText,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
