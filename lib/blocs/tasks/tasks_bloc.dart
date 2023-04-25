import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_app/models/tasks.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) {
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final task = event.task;
    final index = state.allTasks.indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    final updatedTask = task.copyWith(
      isDone: task.isDone == false,
      isDeleted: task.isDeleted == false,
    );
    allTasks.insert(index, updatedTask);
    emit(TasksState(allTasks: allTasks));
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    List<Task> allTasks = List.from(state.allTasks)..remove(event.task);
    emit(TasksState(allTasks: allTasks));
  }
}
