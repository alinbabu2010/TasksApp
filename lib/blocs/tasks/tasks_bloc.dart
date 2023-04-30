import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tasks_app/models/tasks.dart';

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
      GetAllTasks event, Emitter<TasksState> emit) async {
    await tasksRepository.getTask().then((allTasks) {
      emit(state.copyWith(allTasks: allTasks));
    });
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    await tasksRepository.create(event.task);
    add(GetAllTasks());
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

  FutureOr<void> _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    List<Task> removedTasks = List.from(state.removedTasks)..remove(event.task);
    List<Task> allTasks = List.from(state.allTasks)
      ..add(event.task.copyWith(isDeleted: false));
    allTasks.sort((task1, task2) => task1.date.compareTo(task2.date));
    emit(state.copyWith(allTasks: allTasks, removedTasks: removedTasks));
  }

  FutureOr<void> _onDeleteAllTask(
    DeleteForeverAllTasks event,
    Emitter<TasksState> emit,
  ) {
    List<Task> removedTasks = List.from(state.removedTasks)..clear();
    emit(state.copyWith(removedTasks: removedTasks));
  }
}
