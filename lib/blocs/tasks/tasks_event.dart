part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
}

class GetAllTasks extends TasksEvent {
  @override
  List<Object?> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  final bool? isEdit;

  const UpdateTask({this.isEdit, required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveTask extends TasksEvent {
  final Task task;

  const RemoveTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class FavoriteOrUnfavoriteTask extends TasksEvent {
  final Task task;

  const FavoriteOrUnfavoriteTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class RestoreTask extends TasksEvent {
  final Task task;

  const RestoreTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteForeverAllTasks extends TasksEvent {
  const DeleteForeverAllTasks();

  @override
  List<Object?> get props => [];
}
