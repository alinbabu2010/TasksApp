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
    emit(state.copyWith(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    var newTask = event.task;
    List<Task> allTasks = state.allTasks.map((task) {
      return task.id == newTask.id
          ? event.isEdit == true
              ? task.copyWith(
                  title: newTask.title,
                  description: newTask.description,
                )
              : task.copyWith(isDone: task.isDone == false)
          : task;
    }).toList();
    emit(state.copyWith(allTasks: allTasks));
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
        allTasks: List.from(state.allTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  FutureOr<void> _onFavoriteOrUnfavoriteTask(
    FavoriteOrUnfavoriteTask event,
    Emitter<TasksState> emit,
  ) {
    List<Task> taskList = state.allTasks
        .map((task) => task == event.task
            ? task.copyWith(isFavorite: task.isFavorite == false)
            : task)
        .toList();
    emit(state.copyWith(allTasks: taskList));
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
