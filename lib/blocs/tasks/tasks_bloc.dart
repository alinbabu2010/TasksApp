import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/utils/extensions.dart';

import '../../data/repo_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository tasksRepository;

  TasksBloc({required this.tasksRepository}) : super(const TasksState()) {
    on<GetAllTasks>(_onGetAllTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<RestoreTask>(_onRestoreTask);
    on<FavoriteOrUnfavoriteTask>(_onFavoriteOrUnfavoriteTask);
    on<DeleteForeverAllTasks>(_onDeleteAllTask);
  }

  FutureOr<void> _onGetAllTasks(
    GetAllTasks event,
    Emitter<TasksState> emit,
  ) async {
    await tasksRepository.getTask().then((tasks) {
      emit(
        state.copyWith(
          pendingTasks: tasks.pendingTask,
          completedTasks: tasks.completedTask,
          favoriteTasks: tasks.favoriteTask,
          removedTasks: tasks.removedTask,
        ),
      );
    });
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    await tasksRepository.create(event.task);
    add(GetAllTasks());
  }

  FutureOr<void> _onUpdateTask(
      UpdateTask event, Emitter<TasksState> emit) async {
    var eventTask = event.task;
    Task task = event.isEdit == true
        ? eventTask
        : eventTask.copyWith(isDone: !eventTask.isDone!);
    await tasksRepository.updateTask(task);
    add(GetAllTasks());
  }

  FutureOr<void> _onDeleteTask(
    DeleteTask event,
    Emitter<TasksState> emit,
  ) async {
    await tasksRepository.deleteTask(event.task);
    add(GetAllTasks());
  }

  FutureOr<void> _onRemoveTask(
    RemoveTask event,
    Emitter<TasksState> emit,
  ) async {
    var task = event.task.copyWith(isDeleted: true);
    await tasksRepository.updateTask(task);
    add(GetAllTasks());
  }

  FutureOr<void> _onFavoriteOrUnfavoriteTask(
    FavoriteOrUnfavoriteTask event,
    Emitter<TasksState> emit,
  ) {
    // todo: firestore implementation
  }

  FutureOr<void> _onRestoreTask(
    RestoreTask event,
    Emitter<TasksState> emit,
  ) async {
    var task = event.task.copyWith(
      isDeleted: false,
      isFavorite: false,
      isDone: false,
      date: DateTime.now().toString(),
    );
    await tasksRepository.updateTask(task);
    add(GetAllTasks());
  }

  FutureOr<void> _onDeleteAllTask(
    DeleteForeverAllTasks event,
    Emitter<TasksState> emit,
  ) {
    List<Task> removedTasks = List.from(state.removedTasks)..clear();
    emit(state.copyWith(removedTasks: removedTasks));
  }
}
