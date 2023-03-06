import 'package:flutter/material.dart';

import '../../shared/services/realm/models/task_model.dart';

class ListTaskItem extends StatelessWidget {
  const ListTaskItem({
    super.key,
    required this.theme,
    required this.task,
  });

  final ThemeData theme;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Checkbox(value: false, onChanged: (bool? value) {}),
            ],
          ),
        ],
      ),
    );
  }
}
