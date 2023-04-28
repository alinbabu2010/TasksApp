import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tasks_app/models/tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<FavoriteOrUnfavoriteTask>(_onFavoriteOrUnfavoriteTask);
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) {
    emit(state.copyWith(
        pendingTasks: List.from(state.pendingTasks)..add(event.task)));
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final task = event.task;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    if (task.isDone == false) {
      pendingTasks = List.from(pendingTasks)..remove(task);
      completedTasks = List.from(completedTasks)
        ..insert(0, task.copyWith(isDone: true));
    } else {
      completedTasks = List.from(completedTasks)..remove(task);
      pendingTasks = List.from(pendingTasks)
        ..insert(0, task.copyWith(isDone: false));
    }
    emit(state.copyWith(
        pendingTasks: pendingTasks, completedTasks: completedTasks));
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    emit(
      state.copyWith(
        removedTasks: List.from(state.removedTasks)..remove(event.task),
      ),
    );
  }

  FutureOr<void> _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    emit(
      state.copyWith(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  FutureOr<void> _onFavoriteOrUnfavoriteTask(
    FavoriteOrUnfavoriteTask event,
    Emitter<TasksState> emit,
  ) {
    final task = event.task;
    List<Task> favoriteTaskList = List.from(state.favoriteTasks);

    if (task.isDone == false) {
      List<Task> pendingTaskList = state.pendingTasks
          .map((pendingTask) => task == pendingTask
              ? pendingTask.copyWith(
                  isFavorite: pendingTask.isFavorite == false)
              : pendingTask)
          .toList();

      if (task.isFavorite == false) {
        favoriteTaskList.insert(0, task.copyWith(isFavorite: true));
      } else {
        favoriteTaskList.remove(task);
      }

      emit(state.copyWith(
        pendingTasks: pendingTaskList,
        favoriteTasks: favoriteTaskList,
      ));
    } else {
      List<Task> completedTaskList = state.completedTasks
          .map((completedTask) => task == completedTask
              ? completedTask.copyWith(
                  isFavorite: completedTask.isFavorite == false)
              : completedTask)
          .toList();

      if (task.isFavorite == false) {
        favoriteTaskList.insert(0, task.copyWith(isFavorite: true));
      } else {
        favoriteTaskList.remove(task);
      }

      emit(state.copyWith(
        completedTasks: completedTaskList,
        favoriteTasks: favoriteTaskList,
      ));
    }
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
