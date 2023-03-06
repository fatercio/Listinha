import 'package:app/src/home/widgets/task_card.dart';
import 'package:app/src/shared/services/realm/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoard(Uuid.v4(), 'Nova Lista de Tarefas');
  final tasks = [
    Task(Uuid.v4(), 'Tarafas testes', complete: true),
    Task(Uuid.v4(), 'Tarafas testes', complete: true),
    Task(Uuid.v4(), 'Tarafas testes'),
    Task(Uuid.v4(), 'Tarafas testes'),
  ];

  test('getProcess', () {
    final progress = TaskCard(board: board).getProgess(tasks);
    expect(progress, 0.5);
  });
  test('getProcessText', () {
    final progress = TaskCard(board: board).getProgess(tasks);
    expect(progress, 0.5);
  });
}
