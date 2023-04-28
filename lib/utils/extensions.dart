import '../models/tasks.dart';

extension Filter on List<Task> {
  List<Task> getFavoriteTask() {
    return where((task) => task.isFavorite == true).toList();
  }

  List<Task> getCompletedTask() {
    return where((task) => task.isDone == true).toList();
  }

  List<Task> getPendingTask() {
    return where((task) => task.isDone == false).toList();
  }
}
