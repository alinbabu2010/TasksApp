import '../../models/tasks.dart';

abstract class TasksRepository {
  Future<void> create(Task task);

  Future<List<Task>> getTask();
}
