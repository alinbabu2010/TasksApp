import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasks_app/data/repository/tasks_repository.dart';
import 'package:tasks_app/models/tasks.dart';

class FireStoreTasksRepository extends TasksRepository {
  final firestoreInstance = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> create(Task task) async {
    if (firebaseAuth.currentUser == null) {
      return;
    }
    try {
      await firestoreInstance
          .collection((firebaseAuth.currentUser?.uid)!)
          .doc(task.id)
          .set(task.toMap());
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<Task>> getTask() async {
    List<Task> taskList = [];
    try {
      final data = await firestoreInstance
          .collection((firebaseAuth.currentUser?.uid)!)
          .get();
      for (var task in data.docs) {
        taskList.add(Task.fromMap(task.data()));
      }
      return taskList;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    if (firebaseAuth.currentUser == null) {
      return;
    }
    try {
      await firestoreInstance
          .collection((firebaseAuth.currentUser?.uid)!)
          .doc(task.id)
          .update(task.toMap());
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    if (firebaseAuth.currentUser == null) {
      return;
    }
    try {
      await firestoreInstance
          .collection((firebaseAuth.currentUser?.uid)!)
          .doc(task.id)
          .delete();
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
