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
    List<Task> allTasks = List.from(state.allTasks)..remove(event.task);
    emit(
      state.copyWith(
        allTasks: allTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task),
      ),
    );
  }

  FutureOr<void> _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    emit(
      state.copyWith(
        allTasks: List.from(state.allTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
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
