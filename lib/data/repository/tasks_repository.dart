import '../../models/tasks.dart';

abstract class TasksRepository {
  Future<void> create(Task task);

  Future<List<Task>> getTask();

  Future<void> updateTask(Task task);

  Future<void> deleteTask(Task task);

  Future<void> deleteAllTask(List<Task> taskList);
}
